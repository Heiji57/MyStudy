# venv란?
> venv는 python에서 사용하는 가상환경으로 파이썬 패키지를 독립적으로 관리할 수 있도록 도와주는 기능이다.
> > **왜 가상환경이 필요함?**
> - 프로젝트마다 다른 패키지 버전을 유지할 수 있다.
> - 패키지 충돌을 방지하여 안정적인 개발 환경 유지.
> - 협업할 때 팀원들이 같은 환경에서 작업할 수 있다.
# venv 사용법
## 가상환경 생성
```shell
$ python -m venv 가상환경이름
```
- 위와 같은 명령어를 실행시키면 가상환경이 루트 디렉토리에 생성된다. (일반적으로 이름은 .venv로 한다)
## 가상환경 활성화
1. Windows (cmd)
```shell
$ call 가상환경이름/Script/activate
```
1. Linux/Mac
```shell
$ source 가상환경이름/Scripts/activate
```
- 실행할 때는 이름을 명시하고 실행시키는데, 이는 하나의 루트 디렉토리에 여러 개의 가상환경을 만들고, 원하는 것을 활성화하여 사용할 수 있다는 뜻이다. 
- 가끔 activate하는 코드 위치가 Scripts가 아닌 bin에 있는 경우가 있기에, 폴더 구조를 확인하고 작업하는게 좋다.
## 가상환경 모듈 설치
```shell
$ pip install numpy 
$ pip install numpy -r requirements.txt
```
## 가상환경 비활성화
```shell
$ deactivate
```
- 삭제는 그냥 venv 폴더를 삭제하면 된다.
