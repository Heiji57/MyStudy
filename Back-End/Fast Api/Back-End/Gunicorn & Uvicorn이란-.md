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
이처럼 동기 방식의 한계 때문에 실제 작업 시간은 0.1초인데도, 5초를 기다리면서 보낸다. 이때 이 5초 동안 이 워커는 다른 손님을 받을 수 없다.
