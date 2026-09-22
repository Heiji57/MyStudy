> - **Spring boot**는 실행 시 라이브러리를 스캔해서 설정을 자동으로 맞춤 
>
> **- ** **외부 설치 없이 코드로 톰캣을 실행시켜 내장**시킴 
>
> **- ** 주요 로직(트랜잭션 등)은 Proxy가 감싸서 대신 처리함 
>
> **- ** 모든 요청은 DispatcherServlet이 받아서, 적절한 컨트롤러에게 분배함.
## Auto Configuration - 시작의 핵심
---
> - `run()` 작동 시 **Spring Boot**는 프로젝트에 포함된 **라이브러리(Jar)들을 스캔**함.
>
> > **ex**
> **- H2 DB** 라이브러리가 존재 → DB 커넥션을 자동으로 생성
> **- Spring Security** 라이브러리가 존재 → 기본 로그인 필터를 자동으로 낌.
>
> - `@Conditional` : **무조건 만드는 건 아님**. 개발자가 설정 안 했으면 **Spring boot**가 지원하는거임.
> → 직접 설정을 덮어쓸 수 있음.
>
> ✨ **라이브러리(Classpath)**를 확인해서, **빈(Bean)** 설정을 자동으로 대신 함.
## Embedded Tomcat - 서버 구동
---
> **- Spring**은 직접 톰캣을 설치하지만, **Spring Boot**는 **톰캣을 객체로 취급**함. 
>
> > **작동 원리**
> - **Spring Boot** 앱이 초기화될 때, **내부적으로 Tomcat 클래스를 new 해서 생성.**
> → 우리가 만든 **Spring** 컨테이너(**DispatcherServlet**)를 이 **톰캣 객체 안에 연결**함.
> - **외부의 HTTP 요청**을 **톰캣이 받음**
> → 받는 즉시 **Spring**의 **DispatcherServlet에게 모든 권한 위임**
>
> ✨ **Spring Boot**가 실행될 시 코드로 **웹 서버**(**Tomcat**)를 켜고, **Spring**과 연결함.
## IoC 컨테어너와 Proxy (AOP) - 핵심 엔진
---
> **- IoC**(제어의 역전), **Proxy**가 **Spring Boot**의 핵심 요소이다. → **IoC 모를 시 **[**클릭**](/2b43b7994291804ebef6c77f162cda84?pvs=25#2b43b799429180f783b9e0dfb48edc29)
> **- **`@Transactional`을 붙이면, **Spring **은 원본 클래스 대신 **Proxy **객체를 컨테이너에 등록함.
> **- Proxy 객체가 \[**트랜잭션 시작 → 원본 메서드 실행 → 커밋/롤백\] 과정을 대신 수행해줌.
>
> ✨ 실제로는 **Spring**이 만든 **Proxy **객체가 **중간에서 트랜잭션 & 보안 같은 부가 기능(AOP)을 처리**
## DispatcherServlet - 요청 처리 흐름
---
> - 실제 **API 요청이 들어왔을 때 내부**에서 벌어지는 일을 다루는 부분.
>
> 1. **DispatcherServlet** : 모든 요청을 **제일 먼저 받음**. → **누가 처리할지를 찾기** 시작
> 2. **HandlerMapping** : 요청 **URL을 보고** 담당 컨트롤러를 찾아줌.
> 3. **ArgumentResolver** : 컨트롤러 메서드에 필요한 **파라미터를 분석**해, **데이터를 가공**해 넣어줌.
> 4. **Controller 실행** : 이후 개발자가 작성한 비즈니스 로직 실행
>
> ✨ **DispatcherServlet**이 요청을 받아 **Controller**를 찾고, 필요한 **Parameter**를 챙겨서 일을 시킴
