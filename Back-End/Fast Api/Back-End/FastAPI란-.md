# Fast Api란?
> - Python 언어를 기반으로 만들어진 Framework이며, Starlette과 Pydantic을 사용한다.
> - 이름 그대로 속도가 빠른편인데, 개인적인 생각으로 단일 쿼리 기준으로 FastAPI → Node.js → Go (fiber) 인데, 그래도 이정도면 빠른 편이다. (Python Framework 중에는 가장 빠르다.)
> - 사실 빠르다는 개발 속도가 빠른걸 우선으로 해서 나온 Framework인데, 확실히 개발 속도가 빠르다.
> - async await를 기반으로 비동기 처리를 하며, ASGI로 비동기 통신을 한다.
## Test 문서
> - FastAPI로 작성한 API는 API 사용법에 관한 API 명세서를 따로 작성할 필요가 없다. API 문서가 자동으로 생성되는데, 이때 API 문서는 웹 페이지 형태로 제공되며 API 동작을 테스트할 수 있다.
## Database 사용
> - FastAPI는 기본적으로 ORM을 제공하지는 않는데, 그래도 SQLAlchemy를 사용하여 ORM을 사용할 수 있다.
