# Spring boot JWT Security 내부 구조


▫️`Fillter Chain`: Fillter Chain은 Request를 가로챈 후 일련의 절차를 처리한다.
UsernamePasswordAuthenticationFillter는 사용자가 제출한 인증 정보를 처리.

▫️`UsernamePasswordAuthenticationToken 생성`
UsernamepasswordAuthenticationFillter는 UsernamePasswordAuthenticationToken을 생성하여 AuthenticationManager에게 전달.
이 토큰에는 사용자가 제출한 인증 정보가 포함되어 있음.

▫️`AuthenticationManager`: AuthenticationManager는 실제로 인증을 수행하는데, 여러 AuthenticationProvider들을 이용.

▫️`AuthenticationProvider`: 각각의 Provider들은 특정 유형의 인증을 처리한다.
예로 DaoAuthenticationProvider는 사용자 정보를 데이터베이스에서 가져와 인증을 수행.

▫️`PasswordEncoder`: 인증과 인가에서 사용될 패스워드의 인코딩 방식을 지정.

▫️`UserDetailsService`: AuthenticationProvider는 UserDetailsService를 사용하여 사용자 정보를 가져옴.
UserDetailsService는 사용자의 아이디를 받아 loadbyUsername을 호출하여 해당 사용자의 UserDetails를 반환.

▫️`UserDetails`: UserDetails에는 사용자의 아이디, 비밀번호, 권한 등이 포함되어 있다.

▫️`Authentication 객체 생성`: 인증이 성공하면, AuthenticationProvider는 Authentication 객체를 생성하여 AuthenticationManager에게 반환한다.
이 Authentication 객체에는 사용자의 세부 정보와 권한이 포함되어 있다.

▫️`SecuriyContextHolder`: 현재 실행 중인 스레드에 대한 SecurityContext를 제공.

▫️`SecurityContext`: 현재 사용자의 Authentication이 저장되어 있다.
애플리케이션은 SecurityContextHolder를 통해 현재 사용자의 권한을 확인하고, 인가 결정을 함.
