> - 실질적으로 DB의 테이블의 값이라고 생각하면 됨. 데이터를 **저장, 조회, 수정, 삭제** 수행
>
> - 데이터를 가져올 때 원하는 정보만을 가져올 수 있음.** interface 타입 사용**. → **유연성 **📈
>
> - **interface**가 뭔지 모를시 [**클릭**](/2b33b79942918053957dcb89b7775ee6?pvs=25#2b33b79942918011bde1ecb2fcfe498d)
## ✨ 핵심
---
### Spring의 자동 구현
- 개발자가 인터페이스(`interface UserRepository extends JpaRepository<User, Long>`)만 정의. → JPA 모를 시 [**클릭**](/2b43b7994291806bb02ee4047904cdea?pvs=25#2b43b7994291805e9003d4711c75d7c5)
- **Spring Data JPA**가 내부적으로 **구현 클래스(Proxy 객체)를 자동으로 생성하여 Bean 등록**. 
- `findById<Long id>`과 같이 메서드 이름과 규칙이 맞을시 Spring이 **SQL을 자동**으로 만들어 실행.
### 단일 책임 원칙(Single Responsibility Principal)
- 인터페이스에 어떤 데이터의 접근이 필요한지만 명시하고, 구현체는 구현에 집중할 수 있음.
- Repository는 데이터 접근이라는 **하나의 책임**을 가짐.
## 🌠자주 사용되는 annotation
---
### `@Repository`
- spiring boot에게 이건 repository라고 알려줌. Bean 등록도 됨.
### `@EntityGraph`
- 조회 시점에서 **연관된 엔티티를 즉시 로딩**(Eager Loading)으로 가져옴. 1번의 쿼리로 가져와서 상능 향상
### `@Query`
- JPA에서 1번의 쿼리문으로 정보를 가져오지 못할 시 쿼리문을 직접 작성하여 1번의 쿼리문으로 가져올 수 있음. 여기서 사용하는 SQL은 JPQL임.
```java
@Query("SELECT bd FROM BookDetail bd WHERE bd.registrationNumber = :registrationNumber")
```
### `@Lock`
- `LockModeType.PESSIMISTIC_WRITE` : 비관적 잠금. 해당 데이터를 조회하는 동안 다른 트랜잭션의 **읽기와 쓰기를 모두 차단**함.
- `LockModeType.OPTIMISTIC` : 낙관적 잠금. `commit `시점에 데이터가 변경되었는지 확인하고, 충돌시 예외를 발생시켜 `rollback` 시킴.  `@Version` 필드 필요
	### `@Modifying`
- JPA에서 “이 코드는 데이터를 변경할 거야” 라고 알려줌. `@Modifying`을 사용할시 [`@Transactional`](/2ac3b79942918073b6feebd8632ff86a?pvs=25#2ac3b7994291803b866ae52279c83cbf) 사용 필수.
> `@Modifying(clearAutomatically = true)` 을 사용하면 영속성 컨테이너를 비워. 이후 조회 시 DB에서 최신데이터를 다시 로드하도록 강제함으로써 데이터 불일치 문제를 해결.

**영속성**이 뭔지 모르겠으면 [**클릭**](/2ac3b799429180919924e356ef749ec9?pvs=25#2ac3b79942918079a893fefc5a294486)
