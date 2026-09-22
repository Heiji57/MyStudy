> - `controller`에서 사용할 **실직적인 기능**
> - repository를 이용하지 않고 정보를 가져오는 것이 가장 성능 📈 (**언제나 성능을 생각하자**)
> - repository를 이용하거나 다른 서비스를 또 다시 이용하여 기능을 구현.

## 🌠자주 사용되는 annotation
---
### `@Service`
- 서비스라고 spring boot에게 인식시키고 **Bean 등록**을 하여 DI로 spring boot 내부에서 자동으로 관리하도록 할 수 있음
### `@RequiredArgsConstructor`
<synced_block url="https://app.notion.com/p/2ac3b79942918073b6feebd8632ff86a#2ad3b799429180cebe90f23c2b263df4">
	- final 이나 @NonNull 필드를 인자로 받는 생성자를 자동으로 만들어줌. 불변성까지 보장하기에 좋음.
</synced_block>
### `@AuthenticationPrincipal`
- 현재 사용되고 있는 accessToken 정보를 가져올 때 많이 사용.
### `@Transactional`
- 데이터의 일관성을 보장하기 위해 하나의 트랜잭션으로 묶는 작업임.
<table header-row="true">
<colgroup>
<col width="151.5">
<col width="545.5">
</colgroup>
<tr>
<td>속성</td>
<td>사용 목적</td>
</tr>
<tr>
<td>`isolation`</td>
<td>트랜잭션의 격리 수준으로 여러 트랙잭션이 동시에 발생할시 서로 **간섭하는 정도를 지정**.</td>
</tr>
<tr>
<td>`propagation`</td>
<td>기존 트랜잭션을 사용할지 새로운 트랜잭션을 만들지 결정</td>
</tr>
<tr>
<td>`readOnly`</td>
<td>최적화에 좋고, 실수로 데이터가 **변경되지 않게** 할 수 있음.  → 준영속 상태로 만든거임.</td>
</tr>
<tr>
<td>`rollbackFor`</td>
<td>예외 타입을 지정해서 **예외 발생시** `commit`을 `rollback` 시켜버림</td>
</tr>
</table>
> **isolatio**n
	- `READ UNCOMMITTED` : 데이터 **변경중에도 변경 가능.**(`Dirty Read` 발생 가능)
	- `READ COMMITTED` : 다른 트랜잭션이 **`COMMIT`****을 완료한 데이터**만 읽을 수 있도록 보장.
	- `REPEATABLE READ` : 트랜잭션 내에서 한 번 읽었으면 **트랜잭션 끝날때까지 변경 불가.**
	- `SERIALZABLE`: 트랜잭션을 완전히 순차적으로 실행하여 동시성 문제는 발생하지 않으나 **성능 저하.**
