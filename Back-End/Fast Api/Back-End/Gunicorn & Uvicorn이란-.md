# Gunicorn이란?
> Gunicorn은 Ruby의 Unicorn을 보고 만든, Green Unicorn으로 왜 Green이 붙냐라고 하냐면, Python의 상징색인 초록색을 붙여서이다.
> Gunicorn은 Python 버전 Unicorn인 것 처럼 내부 구조는 비슷한데, 프로세스를 격리하여 처리하여, 워커간의 메모리 누수나 오류가 발생해도 다른 워크는 멀쩡한 장점이 있다.
# Gunicorn 동작 과정
```shell
$ gunicorn myapp:app --workers 4
```
> 이 명령어를 실행 시 하나의 관리자 아래에 직원이 4명이 생기고, 각 직원은 독립된 일할 공간을 가진다고, 생각하면 된다.
> 실제로 요청이 들어올 시 각 워커는 하나의 작업만을 수행한다. 만약 워커 1이 복잡한 DB 쿼리를 수행하고 있다면, 다음 워커 2가 다음 작업을 수행한다. (Pre-fork 모델의 장점)
```python
# 동기 방식의 한계
def 느린_요리_만들기():
    # DB에서 재료 가져오기 (3초)
    재료 = database.query("SELECT * FROM 재료")  # 3초 동안 멍때림
    
    # 외부 API 호출 (2초)  
    레시피 = requests.get("https://recipe-api.com")  # 또 2초 멍때림
    
    # 실제 요리는 0.1초
    return 요리하기(재료, 레시피)
```
- 이처럼 동기 방식의 한계 때문에 실제 작업 시간은 0.1초인데도, 5초를 기다리면서 보낸다. 이때 이 5초 동안 이 워커는 다른 손님을 받을 수 없다. → CPU가 5초 동안 논다.
# Uvicorn 이란?
> 2017년, Tom Christie가 비동기적으로 접근하여 만들어진 Uvicorn.
> 기존의 Gunicorn의 동기적 문제를 해결하기 위해 나타난 것이 Uvicorn이다.
```python
# Uvicorn의 비동기 방식
async def 똑똑한_요리_만들기():
    # DB 쿼리 시작하고 바로 다른 일 하러 감
    재료_주문 = database.query("SELECT * FROM 재료")  # 시작만 하고
    
    # API도 호출 시작만 하고
    레시피_요청 = requests.get("https://recipe-api.com")  # 시작만 하고
    
    # 기다리는 동안 다른 손님 주문 받으러 감!
    # (이벤트 루프가 알아서 처리)
    
    # 나중에 준비되면 가져오기
    재료 = await 재료_주문
    레시피 = await 레시피_요청
    
    return 요리하기(재료, 레시피)
```
- 이렇게 다른 작업을 하는동안 기다리는 것이 아닌 다른 작업을 하러 가고, 작업이 완료됐을시 다시 확인하러 오는 방식으로 작동한다.
> **Gunicorn** : 작업하는 동안 10초 동안 그냥 기다림
	**Uvicorn** : 작업 시키고 다른 작업하러 갔다가. 완료되면 다시 돌아옴.
## Event Loop 이란?
> Uvicorn의 핵심 요소는 이벤트 루프인데.
> 이벤트 루프란 부지런한 직원과 같다. 지속적으로 돌아다니면서
> - “DB query 응답 왔나?”
> - “API 응답 왔나?”
> - “다른 서버와 연동 됬나?”
```python
# 이벤트 루프를 쉽게 설명하면
class 이벤트루프:
    def __init__(self):
        self.할일_목록 = []
        self.기다리는_것들 = {}
        
    def 실행(self):
        while True:
            # 1. 완료된 작업 확인
            for 작업 in self.기다리는_것들:
                if 작업.완료됨():
                    self.할일_목록.append(작업.다음_단계)
            
            # 2. 할 일이 있으면 처리
            if self.할일_목록:
                다음_일 = self.할일_목록.pop(0)
                다음_일.실행()
            
            # 3. 잠깐 쉬고 다시 확인 (실제로는 epoll/kqueue 사용)
            time.sleep(0.001)
```
## CPU 컨텍스트 스위칭
```python
// Gunicorn: OS 레벨 컨텍스트 스위칭 (비용 높음)
// ~1-2 마이크로초
save_process_state(current_process);
load_process_state(next_process);
switch_address_space();

// Uvicorn: 유저 레벨 태스크 스위칭 (비용 낮음)
// ~50-100 나노초
save_coroutine_state(current);
load_coroutine_state(next);
// 주소 공간 전환 없음
```
# 성능 차이
> “이러면 무조건 Uvicorn이 좋은거 아님?” 이라고 생각할 수 있지만, 마냥 그렇지만은 않다.
> **시나리오 1: 외부 I/O 조회가 많은 API**
> - **Gunicorn** : worker 4명 이라 가졍 시 각 작업당 100ms를 소요할 때 → 초당 40 처리 가능
> - **Uvicorn** : 프로세스 하나로 작업당 100ms를 소요할 때 → 약 초당 500 처리 가능
> Gunicorn은 4명이 일한다고 해도, 각자 한 번에 한 작업만 처리할 수 있지만 Uvicorn은 1명이 일해도 100ms 기다리는 동안 다른 요청을 추가로 처리할 수 있기 때문이다.
> **시나리오 2: CPU 중점 작업**
> 이런 작업의 경우에는 Gunicorn이 더 빠르다. 결국 Uvicorn이여도 CPU만큼은 기다릴 수 밖에 없기 때문에 CPU 코어 4개를 사용하는 Gunicorn이 더 빠를 수 밖에 없습니다.
그래서 보통 많이 섞어서 사용합니다.
- Gunicorn으로 4개의 프로세스를 관리
- 각 프로세스는 Uvicorn으로 비동기 처리
이렇게 2가지의 이점을 챙길 수 있습니다.
