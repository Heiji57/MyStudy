> - 추상 메서드와 상수를 가지는 완전히 추상화된 타입이다.
>
> - 특정 클래스가 **구현해야 할 기능의 집합**을 명세함. 인터페이스를 구현하는 모든 클래스는 인터페이스에 선언된 모든 메서드가 반드시 정의(구현) 되야함.
>
> > **ex)  선언 : **`interface UserService { public User findById(Long Id); }`
>
> **구현 : **`class UserServiceImpl implements UserService { @Override public User findById(Long Id) { 구현 로직 } }` → **implements를 통해 사용가능.**

## ✨핵심
---
### 느슨한 결합과 유연성
- 비즈니스 로직이 바뀔 시 `UserServiceImpl` 대신 `UserServiceMock`을 사용해 인터페이스만 만족하면 **의존하는 코드를 변경하지 않고 구현체만 수정**. 
- **IoC/DI** 같은 경우 Spring 의 느슨한 결합이 있어야 장점 발휘에 좋음.
### 역할과 구현의 분리
> **역할 정의 : interface**(`UserService`) 는 **무엇을 할 것**인가를 명확히 정의함.
	**구현 정의 : 구현** **클래스**(`UserServiceImpl`)는 **어떻게 할 것**인지를 정의하는지에 집중.
