> - `service`나 `controller`에서 예외가 발생할 때 어떻게 대응할지를 지정하는 기능.
>
> - Exception → CustomException → GlobalExceptionHandler → ErrorResponseDto → ErrorCode

## ➡️ 예외 발생 시 실행 순서
---
### Exception
- `@Getter`를 사용하고 CustomException을 상속 받는다. 실질적으로 코드에서 예외처리 시 사용하는 exception이다.
```java
@Getter
public class AccessTokenValueNotValidException extends BaseCustomException {

    public AccessTokenValueNotValidException(String details) {
        super(ErrorCode.ACCESS_TOKEN_NOT_MATCH, details);
    }
}
```
### CustomException
- errorCode, details를 필드로 받고, details를 사용하는 메서드와 사용하지 않는 메서드 두개를 생성.
```java
@Getter
public abstract class BaseCustomException extends RuntimeException {
    private final ErrorCode errorCode;
    private String details;

    public BaseCustomException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public BaseCustomException(ErrorCode errorCode, String details) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
        this.details = details;
    }
}
```
### GlobalExceptionHandler
- 발생한 예외를 낚아채서 어떤게 발생했고, 그 예외에 대한 상세정보를 표시해주는 부분. `@RestControllerAdvice`를 사용해야 됨.
```java
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(BaseCustomException.class)
    protected ResponseEntity<ErrorResponseDto> handleCustomException(BaseCustomException e, HttpServletRequest request) {
        log.error("[ExceptionHandler] Custom Exception - URI: {}. Code: {}, Message: {}, Type: {}", request.getRequestURI(), e.getErrorCode(), e.getErrorCode().getMessage(), e.getClass().getSimpleName());

        ErrorResponseDto responseDto = (e.getDetails() != null)
                ? ErrorResponseDto.of(e.getErrorCode(), e.getDetails())
                : ErrorResponseDto.of(e.getErrorCode());

        return ResponseEntity
                .status(e.getErrorCode().getHttpStatus())
                .body(responseDto);
    }

}
```
### ErrorResponseDto
- ErrorResponse를 생성하는 팩토리 메서드 클래스.
```java
@Builder
public record ErrorResponseDto(String code, int status, String message, String details) {

    // ErrorCode를 인자로 받아 ErrorResponse를 생성하는 팩토리 메서드
    public static ErrorResponseDto of(ErrorCode errorCode) {
        return ErrorResponseDto.builder()
                .code(errorCode.getCode())
                .status(errorCode.getHttpStatus().value())
                .message(errorCode.getMessage())
                .details(null)
                .build();
    }

    public static ErrorResponseDto of(ErrorCode errorCode, String details) {
        return ErrorResponseDto.builder()
                .code(errorCode.getCode())
                .status(errorCode.getHttpStatus().value())
                .message(errorCode.getMessage())
                .details(details)
                .build();
    }
}
```
### ErrorCode
- 예외 상태 코드, 예외 메시지를 작성하는 enum 클래스
> **C **: Common(공통 에러)
	**M **: Member(회원 관련 에러)
	**A **: Auth(인증/권한 관련 에러)
	**001 **: 해당 카테고리 내의 번호
```java
NOT_VALID_MEMBER_INFO(HttpStatus.BAD_REQUEST, "A005", "회원정보가 일치하지 않습니다.");
```
