> - 데이터 운반체 역할을 하는 객체를 간결하게 정의하기 위해 사용.

## 📚 Record의 주요 특징과 장점
---
> **불변성 (Immutability) **: Record의 모든 필드를 자동으로 `private final`로 선언.
> **간결한 정의** : 생성자, `Getter`, `equals()`, `hashCode()`, `toString()` 메서드를 컴파일러가 자동으로 생성함.
> **컴팩트 생성자 (Compact Constructor)** : Record는 컴팩트 생성자 정의 가능.** 주로 입력값 검증(validation) 추가하는 데 사용**
	<details>
	<summary>컴팩트 생성자</summary>
		매개 변수를 받기만 하고 **필드 할당 로직이 없는** 생성자.
	</details>
> **자동 **`Getter` : 필드 이름과 동일한 이름의 **Getter 메서드가 자동으로 생성**됨.
