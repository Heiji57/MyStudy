> - 데이터 운반체 역할을 수행하며, 데이터를 전달 **받거나 반환**할 수 있음

## 📥 `RequestDto`
---
- record 를 사용하여 작성
```java
public record VerifyEmailRequestDto(
        @NotBlank
        String address,
        @NotBlank
        String verificationCode
) { }
```
### 📤 `ResponseDto`
- client에게 반환하는 `ResponseDto`
```java
public record BookDetailPageResponseDto(
        Long bookId,
        String bookName,
        String publisher,
        String bookImageUrl,
        String bookIntroduction,
        String bookType,
        LocalDate bookDate,
        Long likeCount,
        List<CollectionInformationResponseDto> collectionInformationResponseDtos,
        List<ReviewResponseDto> reviewResponseDtos
) {

    public static BookDetailPageResponseDto of(Long bookId,
                                               String bookName,
                                               String publisher,
                                               String bookImageUrl,
                                               String bookIntroduction,
                                               String bookType,
                                               LocalDate bookDate,
                                               Long likeCount,
                                               List<CollectionInformationResponseDto> collectionInformationResponseDto,
                                               List<ReviewResponseDto> reviewResponseDtos) {
        return new BookDetailPageResponseDto(
                bookId,
                bookName,
                publisher,
                bookImageUrl,
                bookIntroduction,
                bookType,
                bookDate,
                likeCount,
                collectionInformationResponseDto,
                reviewResponseDtos
        );
    }
}
```
- ResponseDto에서 사용하기 위한 ResponseDto(List\<\>)
```java
package plain.bookshelf.domain.book.presentation.dto.response;

import plain.bookshelf.domain.book.entity.BookComment;

import java.time.LocalDateTime;

public record ReviewResponseDto(
        String nickName,
        String chat,
        LocalDateTime chatTime,
        Long likeCount
) {

    public static ReviewResponseDto of(BookComment bookComment) {
        return new ReviewResponseDto(
                bookComment.getMember().getNickName(),
                bookComment.getChat(),
                bookComment.getChatTime(),
                bookComment.getLikeCount()
        );
    }
}
```
