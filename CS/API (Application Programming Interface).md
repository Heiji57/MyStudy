> **API란 정의 및 프로토콜 집합을 사용하여 두 소프트웨어 구성 요소가 서로 통신할 수 있게 하는 메커니즘.**

> ## API가 의미 하는 것
> **API**는 **Application Programming Interface** 의 줄임말로 API 맥락에서 **application**이라는 단어는 **고유한 기능을 가진 모든 소프트웨어**를 나타낸다. **interface**는 두 **application **간의 **서비스 계약**이라고 할 수 있으며, 이 계약은 **요청과 응답을 사용하여 두 application이 서로 통신**하는 방법을 정의한다.

> ## API 작동 원리
> **API **아키텍처는 일반적으로 **client**와 **server **측면에서 설명된다. **요청을 보내는 application을 서버**라고 하며, 예시로 기상청으로 들자면 기상청의 날씨 데이터베이스는 서버이고 모바일 앱은 클라이언트이다.
> <br>API 는 생성된 시기와 이유에 따라 네 가지 방식으로 작동할 수 있다.
> > **SOAP API**
> 이 API는 **단순 객체 접근 프로토콜**을 사용하는데, client와 server는 **XML을 사용**하여 메시지를 교환한다. 과거에 더 많이 사용되었으며 유연성이 떨어진다.
> > **RPC API **
> 이 API를 **원격 프로시저 호출**이라고 하며, client가 server에서 함수나 프로시저를 완료하면 **server가 출력을 client로 재전송**한다.
> > **WebSocket API**
> WebSocket API는 **JSON 객체를 사용**하여 데이터를 전달하며, WebSocket API는 client와 server 간의 **양방향 통신**을 지원한다. **server가 연결된 client에 콜백 메시지를 전송**할 수 있어 REST API보다 효율적이다.
> > **REST API**
> 가장 많이 사용되고 유연한 API로 client가 server에 요청을 데이터로 전송한다. **server가 이 client 입력을 사용하여 내부 함수를 시작하고 출력 데이터를 다시 client에 반환**한다.
