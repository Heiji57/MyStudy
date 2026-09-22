---
"notion_id": "2b43b799-4291-80a2-a09a-c525c64da278"
"notion_url": "https://www.notion.so/2b43b799429180a2a09ac525c64da278"
"상태": "완료"
---

<callout icon="✨">
	- 유연하고, 이해하기 쉽고, 유지보수와 확장성 📈
</callout>
## S - 단일 책임 원칙 (Single Responsibility Principle, SRP)
---
<callout color="gray_bg">
	- 클래스나 모듈은 단 하나의 역할만 해야하고, 오직 하나의 이유로만 변경되야함.
</callout>
## O - 개방-폐쇄 원칙 (Open/Closed Principle, OCP)
---
<callout color="gray_bg">
	- 소프트웨어 요소(클래스, 모듈)는 확장 열림🔓, 수정에 있어서는 닫힘🔒
	→ 주로 인터페이스나 추상 클래스를 구현하여 사용.
</callout>
## L - 리스코프 치환 원칙 (Liskov Substitution Principle, LSP)
---
<callout color="gray_bg">
	- 상위 타입 객체를 하위 타입 객체로 완전 대체 가능해야하며, 프로그램의 정확성이 깨지면 안됨.
</callout>
## I - 인터페이스 분리 원칙 (Interface Segregation Principle, ISP)
---
<callout color="gray_bg">
	- 큰 인테페이스에 있는 메서드들이 각 클래스마다 사용되는것이 다를시 책임별로 인테페이스 분리
</callout>
## D - 의존성 역전 원칙 (Dependency Inversion Principle, DIP)
---
<callout color="gray_bg">
	- 고수준 모듈은 저수준 모듈에 의존하면 안됨. 둘 다 추상화해서 사용
	<empty-block/>
	- 추상화는 구체적인것에 의존하면 안됨. 구체적인 것이 추상화에 의존해야함.
	<empty-block/>
	- DI가 원칙을 가장 잘 구현한 예시이다.
</callout>
<empty-block/>
