---
"notion_id": "3353b799-4291-8084-a2c3-f1b8838cfdcc"
"notion_url": "https://www.notion.so/3353b79942918084a2c3f1b8838cfdcc"
"상태": "완료"
---

<callout icon="✨">
	**OOP 의 핵심 요소**
</callout>
## 캡슐화란 무엇인가?
---
<callout color="gray_bg">
	- 많은 사람들은 캡슐화 == 정보 은닉 이라고 알고 있는 경우가 많습니다. → 이는 틀린 말은 아니다.
	<br>- 좀 깊게 들어가보면, 대표적인 은닉 기법으로는 총 3개가 존재한다.
	>
		1. **객체의 구체적인 타입 은닉 ( = 업 캐스팅)**
		2. **객체의 필드 및  메소드 은닉 ( = 캡슐화)**
		3. **구현 은닉 ( = 인터페이스 & 추상 클래스)**
	<empty-block/>
	- 즉, 캡슐화 == 정보 은닉이 아닌 정보 은닉이라는 **큰 틀** 안에 그걸 구현 하는 방식 중 하나가 캡슐화다.
</callout>
## 정보 은닉이란?
---
<callout color="gray_bg">
	- 정보 은닉은 보안적인 측면이 아닌, “**내가 이건 몰라도 로직이 돌아가겠지?**” 를 가능하게 해준다. 즉, 덜 알아도 된다.
	- 객체 지향 설계에서 대표적인 좋은 설계를 하기 위한 디자인 패턴은 정보 은닉 기법을 극대화 하기 위해 만들어진 설계 방식이며, SOLID 원칙이나 여러 객체 지향 설계 역시 전부 정보 은닉을 기반으로 하고 만들었다고 해도 과언은 아니다.
	- 그래서 정보 은닉에 잘 알고 있을 수록, oop 패턴 기법에 대해 더욱 잘 이해할 수 있다.
</callout>
## 객체의 타입 은닉 (업 캐스팅)
---
<callout color="gray_bg">
	- 구체적인 자식 타입을 은닉함으로써 얻을 수 있는 이점으로는 다형성이 있다.
	> **ex**
		Car라는 클래스를 직접 정의하여 사용하면, 결국 Car라는 클래스에 전적으로 종속되는 관계가 된다.
		여기서 만약 Car와 유사한 기능을 하는 Plane 클래스가 추가 된다고 가정하자.
		설계가 변경되어 Car에서 Plane으로 설계를 바꿔야되는 상황이 오게 된다면, 초기화 코드부터 사용코드까지 전부 바꿔야 된다.
</callout>
```java
class Car {
		public void car() {
				System.out.println("내 꿈은 자동차");
		}
}

class MyClass {
		public void method() {
				Car car = new Car();
				car.car();
		}
}
```
                                                                                           🔻
```java
abstract class Vehicle {
		abstract public void go();
}

class Car extends Vehicle {
		public void go() {
				car();
		}
		private void car() {
				System.out.println("car go go");
		}
}

class Plane extends Vehicle {
		public void go() {
				plane();
		}
		private void plane() {
				System.out.println("plane go go");
		}
}
```
```java
public class MyClass {
		public void method() {
				Vehicle car = new Car();
				
				car.go();
		}
}
```
<callout color="gray_bg">
	- 위 코드 처럼 추상 클래스를 사용하여 하나의 타입으로 통합 할 수 있는 Vehicle 로 **다형성을 구현**할 수 있다.
	- Vehicle 클래스의 go() 메소드만을 호출함으로써, Car 클래스와 관련된 private void car()를 호출하지 않는다.
	- 이렇게 Vehicle 클래스를 통해 사용하기 때문에 Vehicle 클래스만 신경쓰면 된다. ( = new Car()에서 new Plane()으로 변경만 하면 됨)
	- 정보 은닉 효과로 다형성을 누릴 수 있게 된다. ( = 객체 타입과 메서드의 은닉을 한 것.)
</callout>
<empty-block/>
> 그런데 여기서 의문이 들 수 있다. - “**Car를 사용하다가 잠시만 Plane 메서드를 사용하고 싶은데?**”
	→ 이때는 반대로 **다운캐스팅**을 하면 된다.
<empty-block/>
```java
public class MyClass {
		public void method() {
				Vehicle vehicle = new Car();
				vehicle.go(); // car go go 출력
				
				((Plane) vehicle).go(); // plane go go 출력
		}
}
```
<callout color="gray_bg">
	- 이런식으로 다운캐스팅을 진행하면 굳이 클래스를 변경하지 않더라도 Plane을 이미 선언된 vehicle 참조 변수에 캐스팅하면 사용할 수 있습니다.
	- 이처럼 업캐스팅 다운캐스팅은 객체 지향 설계에 굉장히 중요하다.
</callout>
## 객체의 은닉 (디자인 패턴)
---
```java
// ... 위는 똑같음
class VehicleFactory {
		public Vehicle create_C() {
				return new Car();
		}
		
		public Vehicle create_P() {
				return new Plane();
		}
}
```
```java
public class MyClass {
		public void method() {
				VehicleFactory factory = new VehicleFactory();
				
				Vehicle vehicle = factory.create_C();
				
				vehicle.go(); // car go go 출력
		}
}
```
<callout color="gray_bg">
	- 이런 디자인 패턴을 사용하여 설계하면 VehicleFactory와 Vehicle 만으로 Car와 Plane 클래스를 만들 수 있다. → 즉, 구체적인 객체 정보에 대한 정보 은닉을 한 것이다.
	- 이렇게 되면, 정보 은닉이 되면 될 수록 객체의 교체나 로직 변경이 쉬워지고, 이는 개발 생산성과 연계된다.
</callout>
<empty-block/>
## 객체의 필드 & 메소드 은닉 (캡슐화)
---
<callout color="gray_bg">
	- 캡슐화를 진행하면, private 로 필드 객체나 메서드를 접근 제어자 설정을 해서 가져올 수 있는데, 이는 코드의 수정을 최소화 하며, 정보를 은닉 시켜 보호 시킨다.
	<br>- 내부에서 모든 로직이 돌아가게끔 하기 때문에, 내부의 코드만 수정한다면, 외부의 코드는 고칠 필요가 없다는 장점이 있습니다.
	> ex
		아래 코드처럼 캡슐화를 하여 기존에 `firstName = “”` 이러한 코드를 사용하는 것이 아닌 `user.changeName("")` 이런식으로 사용하면, 코드 수정할 때 changeName 로직만 수정하면 됩니다.
</callout>
```java
class User {
    private String firstName
    private String lastName

    public void changeName(String fullName) {
        String parts = fullName.split(" ")
        this.lastName = parts[0]
        this.firstName = parts[1]
    }
}
```
```java
class Car {
		private void go() {} // 은닉 메서드
		private void stop() {} // 은닉 메서드
		private void charge() {} // 은닉 메서드
		
		public void work() { // 공개 메서드
				go();
				stop();
				charge();
		}
}
```
## 구현 은닉
---
<callout color="gray_bg">
	- 위에서 메서드를 은닉 메서드를 사용해 꼭 필요한 공개 메서드를 구축하고, 공개 메서드를 은닉 메서드들과 구분하고 통합적으로 관리하려면 interface로 공개 메서드를 추상화하면 된다.
	- Process 타입의 객체를 InterProcess 인터페이스 타입으로 할당할 수 있다.<br><br>- 공개 메서드를 인터페이스의 추상 메서드로 만들면, 기능 확장에 있어 제약이 줄어든다.
</callout>
```java
interface InterProcess {
    public void work(); // 추상 메소드
}

class Process implements InterProcess {
    private void init(){} // 은닉 메서드
    private void process(){} // 은닉 메서드
    private void release(){} // 은닉 메서드

    public void work(){ // 공개 메서드 + 메소드 구체화
        init(); 
        process();
        release();
    }
}

public class Main {
    public static void main(String[] args) {
        InterProcess c = new Process(); // 인터페이스 역시 상위 클래스 타입 처럼 이용될 수 있다
        c.work();
    }
}
```
