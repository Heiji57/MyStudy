---
"notion_id": "3953b799-4291-803b-bb91-f5057786b482"
"notion_url": "https://www.notion.so/3953b7994291803bbb91f5057786b482"
"상태": "완료"
---

# OSI 7계층
<empty-block/>
<callout icon="💡" color="gray_bg">
	**OSI 7계층**이란? **OSI 계층**은 네트워크에서 <span color="yellow_bg">**통신이 일어나는 과정을 7단계로 나눈 것**</span>을 말함.
</callout>
<empty-block/>
> **OSI 7계층을 나눈 이유**
- 계층을 나눈 이유는 <span color="yellow_bg">**통신이 일어나는 과정을 단계별로 파악할 수 있기 때문**</span>이다.
- 흐름을 한눈에 알아보기 쉽고, 사람들이 이해하기 쉽고
- 7단계 중 특정한 곳에 이상이 생기면 다른 단계의 장비 및 소프트웨어를 건들이지 않고도 <span color="yellow_bg">**이상이 생긴 단계만 고칠 수 있기 때문**</span>.
<table>
<colgroup>
<col width="63">
<col width="308">
<col width="330">
</colgroup>
<tr>
<td></td>
<td>                           OSI 7 Layer Model</td>
<td>                                   TCP/IP Protocol</td>
</tr>
<tr color="red">
<td>7 Layer</td>
<td>                           Application Layer</td>
<td>                                       Application</td>
</tr>
<tr color="orange">
<td>6 Layer</td>
<td>                         Presentation Layer</td>
<td>                             <span color="red"> telent FTP DHCP TFTP</span></td>
</tr>
<tr color="yellow">
<td>5 Layer</td>
<td>                              Session Layer</td>
<td>                          <span color="red">   HTTP SMTP DNS SNMP</span></td>
</tr>
<tr color="green">
<td>4 Layer</td>
<td>                             Transport Layer</td>
<td>                                 TCP Transport UDP</td>
</tr>
<tr color="blue">
<td>3 Layer</td>
<td>                              Network Layer</td>
<td>                                            Internet<br>                                  ICMP ARP RARP IP</td>
</tr>
<tr color="purple">
<td>2 Layer</td>
<td>                              DataLink Layer</td>
<td>                                  Network Interface</td>
</tr>
<tr color="gray">
<td>1 Layer</td>
<td>                              Physical Layer</td>
<td>                                 <span color="purple"> Network Interface</span></td>
</tr>
</table>
<empty-block/>
### 1계층 - 물리계층(Physical Layer)
---
<empty-block/>
- 이 계층에서는 주로 **전기적, 기계적, 기능적인** 특성을 이용해서 통신 케이블로 데이터를 전송하게 된다.
- 단지 데이터 <span color="yellow_bg">**전기적인 신호로 변환해서 주고받는 기능만**</span> 할 뿐이다.
- 대표적인 장비는 **통신 케이블, 리피터, 허브** 등이 있다.
<empty-block/>
<callout icon="💡" color="gray_bg">
	이 계층에서는 <span color="yellow_bg">**단지 데이터를 전달만 할뿐**</span> 전송하려는(또는 받으려는)데이터가 무엇인지, 어떤 에러가 있는지 등에는 전혀 신경 쓰지 않는다.
</callout>
<empty-block/>
### 2계층 - 데이터 링크계층(DataLink Layer)
---
<empty-block/>
- 물리계층을 통해 송수신되는 정보의 오류와 흐름을 관리하여 <span color="yellow_bg">**안전한 정보의 전달을 수행**</span>할 수 있도록 도와주는 역할을 한다.
- **전송되는 단위를 프레임**이라고 하고, 대표적인 장비로는 **브리지, 스위치** 등이 있다.(MAC 주소를 사용)
- <span color="yellow_bg">**CRC 기반의 오류 제어와 흐름 제어가 필요**</span>하다. 네트워크 위의 개체들 간 데이터를 전달.
- 물리 계층에서 발생할 수 있는 오류를 찾아 내고, 수정하는 데 필요한 <span color="yellow_bg">**기능적, 절차적 수단을 제공.**</span>
- **네트워크 브릿지나 스위치** 등이 이 계층에서 동작하며, <span color="yellow_bg">**직접 이어진 곳에만 연결할 수 있다.**</span>
	**→  프레임에 주소부여(MAC-물리적주소) 에러검출/재전송/흐름제어**
	<empty-block/>
<callout icon="💡" color="gray_bg">
	**데이터 링크 계층(Data link layer)**은 **포인트 투 포인트(Point to Point)** 간 <span color="yellow_bg">**신뢰성있는 전송을 보장하기 위한 계층**</span>
</callout>
<empty-block/>
### 3계층 - 네트워크 계층(Nettwork Layer)
---
<empty-block/>
- 경로를 선택하고 주소를 정하고 <span color="yellow_bg">**경로에 따라 패킷을 전달해주는 것**</span>이 이 계층의 역할이다.
- <span color="yellow_bg">**대표적인 장비는 라우터**</span>이며, 요즘은 2계층의 장비 중 스위치라는 장비에 라우팅 기능을 장착한 Layer 3스위치도 있다.
- **라우팅, 흐름 제어, 세그멘테이션(segmentation/desegmentation), 오류 제어, 인터네트워킹(Internetworking)** 등을 수행한다. 
- <span color="yellow_bg">**라우터가 이 계층에서 동작**</span>하고 이 계층에서 동작하는 스위치도 있다. 
- 데이터를 연결하는 다른 네트워크를 통해 전달함으로써 <span color="yellow_bg">**인터넷이 가능하게 만드는 계층**</span>이다. 
<empty-block/>
<details>
<summary>**IP 계층**</summary>
	<callout icon="💡" color="gray_bg">
		TCP/IP 상에서 IP 계층이란 네트워크의 주소 (IP 주소)를 정의하고, <span color="yellow_bg">**IP 패킷의 전달 및 라우팅을 담당**</span>하는 계층.
	</callout>
	- OSI 7계층모델의 관점에서 보면 IP 계층은 네트워크계층에 해당
		- 즉, <span color="yellow_bg">**패킷을 목적지까지 전달하는 역할**</span> 및 그에 수반되는 기타 역할을 함.
	<empty-block/>
	> **IP 계층의 주요 역할**
		- IP 계층에서는 그 하위계층인 데이터링크 계층의 <span color="yellow_bg">**하드웨어적인 특성에 관계없이 독립적인 역할**</span>을 수행.
	<empty-block/>
	> **IP 계층 상에 있는 주요 프로토콜**
		- 패킷의 전달을 책입지는 IP
		- 패킷 전달 에러의 보고 및 진달을 위한 ICMP
		- 복잡한 네트워크에서 인터네트워킹을 위한 경로를 착제해주는 라우팅 프로토콜
</details>
<details>
<summary>**IP 프로토콜**</summary>
	<callout icon="💡" color="gray_bg">
		TCP/IP 기반의 인터넷 망을 통하여 <span color="yellow_bg">**데이타그램의 전달**</span>을 담당하는 프로토콜
	</callout>
	> **주요기능**
		- IP 계층에서 <span color="yellow_bg">**IP 패킷의 라우팅 대상**</span>이 됨 (Roution)
		- **IP 주소 지정** (Addressing)
	<empty-block/>
	> **주요 특징**
		- **신뢰성**(에러제어) 및** 흐름제어** <span color="yellow_bg">**기능이 전혀 없음**</span> → Best-Effort.
			- **신뢰성을 확보하려면** IP 계층 위의 <span color="yellow_bg">**TCP와 같은 상위 트랜스포트 계층에 의존**</span>.
		- <span color="yellow_bg">**비연결성 데이터그램**</span> 방식으로 전달되는 프로토콜 → Connectionless
		- **패킷의 완전한 전달**(소실, 중복, 지연, 순서바뀜 등이 없게함)을 <span color="yellow_bg">**보장 않음**</span> → Unreliable
		- IP 패킷 <span color="yellow_bg">**헤더 내 수신 및 발신 주소를 포함**</span> → IPv4 헤더, IPv6 헤더, IP 주소
		- IP 헤더 내 바이트 전달 순서 : 최상위 바이트(MSB)를 먼저 보냄 → Big-endian
		- 경우에따라, 단편화가 필요함.
		- **TCP, UDP, ICMP, IGMP** 등이 <span color="yellow_bg">**IP 데이타그램에 실려**</span>서 전송.
</details>
<empty-block/>
<callout icon="💡" color="gray_bg">
	**네트워크 계층(Network layer)**은 여러개의 노드를 거칠때마다 경로를 찾아주는 역할을 하는 계층으로 <span color="yellow_bg">**다양한 길이의 데이터를 네트워크들을 통해 전달**</span>하고, 그 과정에서 전송 계층이 요구하는 <span color="yellow_bg">**서비스 품질(QoS)을 제공하기 위한 기능적, 절차적 수단을 제공**</span>한다.
</callout>
<empty-block/>
### 4계층 - 전송 계층(Transport Layer)
---
<empty-block/>
- <span color="yellow_bg">**통신을 활성화**</span>하기 위한 계층이다. **보통 TCP프로토콜**을 이용하며, <span color="yellow_bg">**포트를 열어서 응용프로그램들이 전송**</span>을 할 수 있게 한다.
- 만약 데이터가 왔다면 4계층에서 해당 <span color="yellow_bg">**데이터를 하나로 합쳐서 5계층에 던져 준다.**</span>
- <span color="yellow_bg">**이 계층까지는 물리적인 계층**</span>에 속한다.(TCP/UDP프로토콜을 사용.)
- 시퀸스 넘버 기반의 오류 제어 방식을 사용
- 종단간(end-to-end) 통신을 다루는 최하위 계층으로 종단간 <span color="yellow_bg">**신뢰성 있고 효율적인 데이터를 전송**</span>하며, 기능은 <span color="yellow_bg">**오류검출 및 복구와 흐름제어, 중복검사 등을 수행**</span>한다.
-\> **패킷 생성(Assembly/Sequencing/Deassembly/Error detection/Request repeat/Flow control) 및 전송**
<empty-block/>
<details>
<summary>**TCP 프로토콜**(Transmission control Protocol)</summary>
	<callout icon="💡" color="gray_bg">
		**양종단 호스트** 내 프로세스 상호 간에 <span color="yellow_bg">**신뢰적인 연결지향성**</span> 서비스를 제공.
		- IP의 **비신뢰적인 최선형 서비스**에다가 **신뢰적인 연결지향성** 서비스를 제공하게 됨.
		- <span color="yellow_bg">**신뢰적인 전송을 보장함**</span>. 어플리케이션 <span color="yellow_bg">**구현이 한층 쉬워지게 됨**</span>.
	</callout>
	> **신뢰성 있음** (Reliable)
		- **패킷 손실, 중복, 순서바뀜** 등이 없도록 보장.
		- TCP 하위계층인 IP 계층의 신뢰성 없는 서비스에 대해 <span color="yellow_bg">**다방면으로 신뢰성을 제공.**</span>
	<empty-block/>
	> **연결 지향적** (Connection-oriented) → **TCP 연결**
		- UDP 비연결성(Connectionless)인 것과는 달리<span color="yellow_bg">**, TCP는 연결지향적**</span>임.
		- **느슨한 연결**(Loosly Connected)을 갖으므로 강한 연결을 의미하는 가상회선이라는 표현 보다는 오히려 <span color="yellow_bg">**연결지향적**</span>이라고 말함.
		- <span color="yellow_bg">**연결 관리를 위한 연결설정 및 연결해제 필요**</span> → TCP 연결설정, TCP 연결종료.
		- 양단간 어플리케이션/프로세스는 **TCP가 제공**하는 <span color="yellow_bg">**연결성 회선을 통하여 서로 통신**</span>.
</details>
<details>
<summary>**UDP 프로토콜**(User Datagram Protocol)</summary>
	<callout icon="💡" color="gray_bg">
		**전송 계층의 통신 프로토콜의 하나** (TCP에 대비됨)
		- 신뢰성이 낮은 프로토콜로써 <span color="yellow_bg">**완전성을 보증하지 않음**</span>.
		- 가상회선을 굳이 <span color="yellow_bg">**확립할 필요가 없고 유연하며 효율적 응용**</span>의 데이타 전송에 사용.
	</callout>
	> **비연결성이고, 신뢰성이 없으며, 순서화되지 않은 Datagram 서비스 제공**
		- 메세지가 제대로 <span color="yellow_bg">**도착했는지**</span> <span color="yellow_bg">**확인하지 않음**</span> (확인응답 없음)
		- 수신된 메세지의 <span color="yellow_bg">**순서를 맞추지 않음**</span> (순서제어 없음)
		- 흐름 제어를 위한 <span color="yellow_bg">**피드백을 제공하지 않음**</span> (흐름제어 없음)
		- 검사합을 제외한 특별한 <span color="yellow_bg">**오류 검출 및 제어 없음**</span> (오류제어 거의 없음)
			- UDP를 사용하는 <span color="yellow_bg">**프로그램 쪽에서 오류제어 기능을 스스로 갖추어야 함**</span>.
		- 데이터그램 지향의 전송계층용 프로토콜 (<span color="yellow_bg">**논리적인 가상회선 연결이 필요없음**</span>)
			- <span color="yellow_bg">**비연결접속상태**</span> 하에서 통신
	<empty-block/>
	> **실시간 응용 및 멀티캐스팅 가능**
	- 빠른 요청과 응답이 필요한 실시간 응용에 적합
	- 여러 다수 지점에 전송 가능 (1:다)
	<empty-block/>
	> **헤더가 단순함**
	- **UDP는 TCP **처럼 <span color="yellow_bg">**16비트의 포트 번호**</span>를 사용.
	- 헤더는 <span color="yellow_bg">**고정크기의 8바이트(TCP는 20바이트)**</span>만 사용.
		- 헤더 처리에 <span color="yellow_bg">**많은 시간과 노력을 요하지 않음**</span>.
	<empty-block/>
</details>
<empty-block/>
<callout icon="💡" color="gray_bg">
	**전송 계층**(Transport layer)은 양 끝단(End to end)의 <span color="yellow_bg">**사용자들이 신뢰성있는 데이터를 주고 받을 수 있도록**</span> 해 주어, 상위 계층들이 데이터 전달의 <span color="yellow_bg">**유효성이나 효율성을 생각하지 않도록 해준다.**</span>
</callout>
<empty-block/>
### 5계층 - 세션 계층(Session Layer)
---
<empty-block/>
<callout icon="💡" color="gray_bg">
	<span color="yellow_bg">**데이터가 통신하기 위한 논리적인 연결**</span>을 말한다.
	<empty-block/>
	4계층에서도 연결을 맺고 종료할 수 있기 때문에, <span color="yellow_bg">**어느 계층에서 통신이 끊어 졌나 판단하기는 한계가 있다**</span>.
	- 세션 계층은 4 계층과 무관하게 <span color="yellow_bg">**응용 프로그램 관점에서 봐야한다**</span>.
	- **세션 설정, 유지, 종료, 전송 중단시 복구** 등의 기능이 있다.
</callout>
<empty-block/>
<details>
<summary>**셰션 계층**(Session Layer)은 양 끝단의 <span color="yellow_bg">**응용 프로세스가 통신을 관리**</span>하기 위한 방법을 제공한다.</summary>
	**세션(Session)**: <span color="yellow_bg">**사용자와 서버 간의 대화 상태를 유지**</span>하는 방법.
</details>
- 동시 송수신 방식(duplex), 반이중 방식(half-duplex), 전이중 방식(Full Duplex)의 통신과 함께** 체크 포인팅과 유휴, 종료, 다시 시작** 과정 등을 수행한다.
- 이 계층은 <span color="yellow_bg">**TCP/IP 세션을 만들고 없애는 책임**</span>을 진다.
- <span color="yellow_bg">**통신하는 사용자들을 동기화하고, 오류복구**</span> 명령들을 일괄적으로 다룬다.
- 통신을 하기 위한 세션을 **확립/유지/중단** (**운영체제가 해줌**)
<empty-block/>
### 6계층 - 표현 계층(Presentation Layer)
---
<empty-block/>
<callout icon="💡" color="gray_bg">
	데이터 표현이 상이한 <span color="yellow_bg">**응용 프로세스의 독립성을 제공하고, 암호화**</span> 한다.
</callout>
<empty-block/>
- 표현 계층(Presentation Layer)은 <span color="yellow_bg">**코드 간의 번역을 담당**</span>하여 사용자 **시스템**에서 <span color="yellow_bg">**데이터의 형식상 차이를 다루는 부담을 응용 계층으로부터 덜어 준다**</span>.
<details>
<summary><span color="yellow_bg">**MIME 인코딩이나 암호화**</span> 등의 동작이 이 계층에서 이루어짐.</summary>
	**인코딩**(Encoding): 데이터를 <span color="yellow_bg">**컴퓨터가 이해 할 수 있는 바이너리 형식으로 변환**</span>하는 과정.
</details>
- 사용자의 명령어를 **완성및 결과 표현, 포장/압축/암호화.**
> **ex**
- **EBCDIC로 인코딩된 문서 파일**을** ASCII로 인코딩된 파일로 바꿔 주는 것**, 해당 데이터가 TEXT인지, 그림인지, GIF인지 JPG인지의 <span color="yellow_bg">**구분등이 표현 계층의 몫**</span>이다.
<empty-block/>
### 7계층 - 응용 계층(Application)
---
<empty-block/>
<callout icon="💡" color="gray_bg">
	**모든 통신의 양 끝단**은 HTTP와 같은 <span color="yellow_bg">**프로토콜이지 응용프로그램이 아니다**</span>.
</callout>
- 최종 목적지로서 **HTTP, FTP, SMTP, POP3, IMAP, Telnet** 등과 같은 프로토콜이 있다.
- 통신 패킷들은 방금 나열한 프로토콜에 의해 모두 처리되며 우리가 사용하는 브라우저나, 매일 프로그램은 <span color="yellow_bg">**프로토콜을 보다 쉽게 사용하게 해주는 응용프로그램**</span>이다.
- 응용 계층(Application Layer)은 <span color="yellow_bg">**응용 프로세스와 직접 관계**</span>하여 <span color="yellow_bg">**일반적인 응용 서비스를 수행**</span>한다.
- 일반적인 응용 서비스는 관련된 응용 프로세스들 사이의 전환을 제공한다.
> **응용 서비스의 예**
	- 가상 터미녈(예: 텔넷),Job transfer and Manupulation protocl(JTM, 표준 ISO/IEC 8832)등이 있다.
- 네트워크 소프트웨어 UI 부분, 사용자의 입출력(I/O)부분.
<details>
<summary>**HTTP 프로트콜**(HyperText Transfer Protocol)</summary>
	<callout icon="💡" color="gray_bg">
		웹 상에서 웹 서버 및 웹브라우저 상호 간의 데이터 전송을 위한 <span color="yellow_bg">**응용계층 프로토콜**</span>
		- **처음**에는, WWW 상의 <span color="yellow_bg">**하이퍼텍스트 형태의 문서를 전달**</span>하는데 주로 이용.
		- **현재**에는, 이미지, 비디오, 음성 등 <span color="yellow_bg">**거의 모든 형식의 데이터 전송**</span> 가능.
	</callout>
	1. **요청 및 응답의 구조**
		- 동작형태가 <span color="yellow_bg">**클라이언트/서버 모델로 동작**</span>
	2. **메세지 교환 형태의 프로토콜**
		- 클라이언트와 서버 간에 <span color="yellow_bg">**HTTP 메세지를 주고받으며 통신**</span>
		- HTTP의 응답 및 요청 메세지 구성
		- HTTP 메세지 내 헤더 항목들
	3. **트랜잭션 중심의 비연결성 프로토콜**
		- <span color="yellow_bg">**종단간 연결이 없음**</span> (Connectionless)
		- <span color="yellow_bg">**이전의 상태를 유지하지 않음**</span> (Stateless)
	4. **전송계층 프로토콜 및 사용 포트 번호**
		- 전송계층 프로토콜: **TCP**
		- 사용 포트 번호:** 80번**
	5. **http 표준**
		> HTTP 1.0 : RFC 1945 (\~1997년)
			- <span color="yellow_bg">**유용한 초기 개념**</span>들 도입
			- **HTTP 헤더, HTTP 메서드, HTTP 응답 코드, 리다이렉트, 비지속 연결** 등
		> HTTP 1.1 : RFC 2068 → RFC 2616 → RFC 7230 \~ 7235 (1998년\~)
			- HTTP 1.0 으로부터 **기능 향상**
			- HTTP 헤더 내 <span color="yellow_bg">**Host 필드를 필수 항목**</span>으로 함 (**1개 IP 주소에 다수의 가상 호스팅 가능**)
			- HTTP 헤더 내 <span color="yellow_bg">**Accept 필드에 의한 컨텐츠 협상**</span>
			- 잘 정의된 <span color="yellow_bg">**캐시 컨트롤**</span>
			- <span color="yellow_bg">**블록 단위 인코딩 전송**</span>
			- <span color="yellow_bg">**지속 연결 회선**</span>(킵얼라이브 커넥션)을 통한 <span color="yellow_bg">**재사용 가능**</span>
			- 요청 <span color="yellow_bg">**파이프라인을 이용한 병렬 커넥션 처리**</span>(실제 사용 거의 없음) 등
</details>
<empty-block/>
<empty-block/>
<empty-block/>
<empty-block/>
