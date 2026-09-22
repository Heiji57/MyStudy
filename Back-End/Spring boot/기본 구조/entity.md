> - DB의 테이블 = 객체. **객체의 정보를 담은 클래스.**
> - 값을 수정할때는 `@Setter` 를 사용하지 않고 메서드로 지정해서 내부에서 수정

## 🌠 자주 사용되는 annotation
---
### `@Getter` 
- 객체 값을 가져올 수 있음.
### `@Entity`
- 이 class가 `entity` class라고 명시적 표시. Bean 등록을 하여 **DI 주입**.
### `@Table`
- 테이블 이름 **불일치 문제** 해결 및 **스키마 레벨 설정**.
### `@Builder`
- Builder 패턴을 사용하여 **객체를 생성**할 수 있음. `@AllArgsConstructor`, `@NoArgsConstructor`를 같이 사용함. 왠만하면 **생성자 단위로 사용하는게 좋음**
### `@AllArgsConstructor`
- 클래스의 **모든 필드를 인수로 받는 생성자**를 자동으로 생성해줌.
### `@NoArgsConstructor`
- 매개변수가 없는 **기본 생성자**를 자동으로 생성.` @NoArgsConstructor`가 없을 시 **객체를 만들 수 없음**. → Builder 사용 X.
- DTO 객체로 변환(역직렬화)할 때 `ObjectMapper`가 **기본 생성자를 사용하여 객체를 만든 후 필드에 값을 설정**하기에 **기본 생성자가 없을 시 객체를 만들 수 없음**.
### `@SequenceGenerator`
- seqence를 만들 때 사용. `@GeneratedValue`에서 strategy의 **타입이 SEQUENCE일 때만 필요**. → postgres DB에서 id 타입의 표준이 sequence.
> **name **: JPA에서 sequence를 식별할 때 사용하는 **논리적 식별자**.
	**sequenceName **: sequence 이름.
	**allocationSize **: Id 시작 값.
### `@Id`
- id값으로 사용할 컬럼을 지정할 때 사용. 보통 PK 컬럼 값에만 사용.
### `@Column`
- 컬럼 값의 상태를 지정할 수 있음. ex) name, nullable, unique, length 등 지정 가능.
### `@GeneratedValue`
- strategy로 Id 값 할당 방식 지정 가능. SEQUENCE를 사용시 generator를 사용해 generator(sequence name) 지정 필요.
### `@Builder.Default`
- Builder로 객체 생성 시 기본 값을 지정해서 Builder에서 값 작성을 하지 않더라고 **값이 자동**으로 적재됨.
### `@OneToMany`
- 일대다 매핑 시 사용. List 타입으로 자식 객체를 사용.
> **mappedBy **: 매핑할 엔티티(테이블) 지정.
	**cascade **: 매핑된 테이블과의 상관관계 설정.
	**fetch **: 데이터 로딩 시 어떻게 할지 지정. **보통 LAZY**를 사용하고 `repository`에서` @EntityGraph`으로 EAGER 사용.
	**orphanRemoval **: 연관된 객체가 삭제 되었을 시 **관련된 객체의 삭제 여부**.
<table header-row="true" header-column="true">
<colgroup>
<col width="81.33332824707031">
<col width="619.3333282470703">
</colgroup>
<tr>
<td>타입</td>
<td>설명</td>
</tr>
<tr>
<td>ALL</td>
<td>cascade 타입의 모든 특징을 가지고 있음. 부모 객체가 아닐 시** 왠만하면 사용하지 않는게 좋음**.</td>
</tr>
<tr>
<td>REFRESH</td>
<td>DB의 최신 상태를 자식 엔티티도 받게함.</td>
</tr>
<tr>
<td>DETACH</td>
<td>부모 엔티티가 사라질 시 자식 엔티티를 준영속 상태로 만듬. 왠만하면 사용 안함.</td>
</tr>
<tr>
<td>REMOVE</td>
<td>부모 엔티티 삭제 시 자식 엔티티도 삭제.</td>
</tr>
<tr>
<td>MERGE</td>
<td>부모 엔티티를 영속 상태로 병합할 시 자식 엔티티도 영속 상태로 병합. 왠만하면 사용 안함.</td>
</tr>
<tr>
<td>PERSIST</td>
<td>부모 엔티티를 저장할 시 자식 엔티티들도 영속성 컨텍스트에 저장. 잘 사용 안함.</td>
</tr>
</table>
### `@ManyToOne`
- 다대일 매핑 시 사용. 부모 객체를 사용. 왠만하면 부모 객체가 삭제될 시 같이 삭제.
> **optional **: **부모 객체의 필요성** 설정.
	**cascade **: 매핑된 테이블과의 상관관계 설정.
	**fetch **: 데이터 로딩 시 어떻게 할지 지정. **보통 LAZY**를 사용하고 `repository`에서` @EntityGraph`으로 EAGER 사용.
### `@JoinColumn`
- `@ManyToOne` 필드와 함께 사용.
> **name **: 부모 객체 엔티티 class 이름.
	**nullable **: 이 값이 null이여도 되는지 여부.
	**foreign **: 외래키를 어떻게 관리할지 지정.
### `@Enumerated`
- enum 타입을 사용하는 필드임을 지칭.
