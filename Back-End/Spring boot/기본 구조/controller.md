> - service에서 만든 기능을 실질적으로 사용하는 곳. client와의 통신을 통해 **응답을 보내줌**.
> - `Dto`를 통해 값을 받아와서 사용함으로써 `entity`에 직접적으로 노출시키지 않아도 됨.

## 🌠 자주 사용되는 annotation
---
### `@RestController`
- `@ResponseBody` , `@Controller` annotation의 조합. `MessageConverter`를 사용해 자동으로 해당 객체를 **JSON 문자열로 반환**하여 전송. **화면 대신 데이터를 반환**하는 API 서버의 컨트롤러라는 명시적 의미도 있음.
### `@RequiredArgsConstructor`
<synced_block_reference url="https://app.notion.com/p/2ad3b799429180ef8ae3c96c5251dd77#2ad3b799429180cebe90f23c2b263df4">
	- final 이나 @NonNull 필드를 인자로 받는 생성자를 자동으로 만들어줌. 불변성까지 보장하기에 좋음.
</synced_block_reference>
### `@Slf4j`
- 주석을 달 수 있도록 해주는 annotation.
### `@RequestMapping`
- 다른 API의 Url이 겹치는 경우 사용하여 **중복되는 부분**을 반복적으로 작성할 필요가 없어짐`.`
### `@~Mapping`
- 실질적 API. annotation 뒷 부분에 url을 정보를 토대로 연결할 수 있음.
<table header-row="true" header-column="true">
<colgroup>
<col width="100.33332824707031">
<col width="608.3333282470703">
</colgroup>
<tr>
<td>HTTP 메서드</td>
<td>사용 예시</td>
</tr>
<tr>
<td>GET</td>
<td>이미 존재하는 **정보를 가져올 때 **많이 사용 ex) 메인 페이지 정보. `@RequestBody`를 같이 사용하면 안됨.</td>
</tr>
<tr>
<td>POST</td>
<td>객체를 새로 **만들거나 노출되면 안되는 정보를 사용**할 때 사용 → POST는 반환을 안 하기 때문.</td>
</tr>
<tr>
<td>PUT</td>
<td>이미 존재하는 객체의 정보를 많이 **수정 할때** 자주 사용.</td>
</tr>
<tr>
<td>DELETE</td>
<td>객체의 정보를 **삭제 할때** 사용.</td>
</tr>
<tr>
<td>PATCH</td>
<td>객체의 정보를 **수정 할때** 사용. PUT가 큰 차이 없음.</td>
</tr>
</table>
### `@RequestBody`
- `RequestDto`를 통해 정보를 가져올 때 사용. 같이 사용하는 annotation으로는 [`@Valid`](/2ad3b799429180ef8ae3c96c5251dd77?pvs=25#2ad3b799429180e2a2dad930095710a4)가 있음.
### `@Valid`
- `RequestDto`의 Body에서 가져오는 정보중 `@NotBlank`, `@NonNull` 등 annotation의 정보가 유효하지 않은지 판별하여 **유효하지 않을 시 예외**를 발생시키는 annotation.
### `@RequestParam`
- 정보를 **header의 uri**에 담아서 정보를 받을 때 사용.
```basic
http://localhost:8080/api/book/comment/retouch?commentId=1
```
### `@PathVariable`
- uri의 \{…\}정보를 가져올 때 사용. ex) /book/7082 ← \{book_id\}
```basic
http://13.124.75.92:8080/book/7082
```
