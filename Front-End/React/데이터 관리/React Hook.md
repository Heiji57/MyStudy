# React Hook이란?
> React Hook은 함수형 컴포넌트에서 상태와 생명주기 기능을 사용할 수 있도록 도와주는 기능.
> 기존에는 클래스형 컴포넌트에서만 상태와 생명주기 메서드를 사용 가능.<br>→ Hook을 활용하면 함수형 컨포넌트에서도 이를 쉽게 구현 가능.
## 생명주기란?
> React에서 생명주기란 컴포넌트가 화면에 나타나고, 업데이트되고, 사라지는 과정을 의미.
> 1. 컴포넌트가 처음 나타날 때 (마운트) → componentDidMount
> 2. 컴포넌트가 업데이트될 때 (리렌더링) → comonentDidUpdate
> 3. 컴포넌트가 사라질 때 (언마운트) → componentWillUnmount
> 클래스형 컴포넌트에서는 이러한 과정들을 각각의 메서드로 관리했지만, 함수형 컴포넌트에서는 useEffect 같은 Hook을 사용해서 이 과정을 처리할 수 있다.
## React Hook 종류
> > **useState**: 상태 관리
> **useEffect**: 부수 효과(side effect 처리
> **useRef**: DOM 요소 접근 및 렌더링과 무관한 값 저장
> **useReducer**: 복잡한 상태 관리
> **useContext**: 전역 상태 관리
> **useMemo**: 성능 최적화를 위한 값 메모이제이션
> **useCallback**: 성능 최적화를 위한 함수 메모이제이션
### useState
> 컴포넌트의 상태를 관리하는 가장 기본적인 hook
> 상태 값과 상태를 변경하는 함수를 반환
```javascript
import { useState } from 'react';

fuction Counter() {
	const [count, setCount] = useState(0);
	
	return (
		<div>
			<p>현재 카운트: {count}</p>
			{/* 상태 업데이트 함수인 set Count를 사용하여 count 상태를 업데이트. */}
			<button onClick=[() => setCount(count + 1)}증가</button>
		</div>
	);
}
```
> useState는 배열을 반환한다. 배열의 첫번째 요소에는 현재 상태값 두번째에는 상태를 변경하는 함수가 들어간다.
ex) 숫자, 문자열, 불리언 등 단순한 상태를 관리할 때, 상태 변경이 간단할 때
### useRef
> DOM 요소에 접근하거나 값이 변경되어도 리렌더링되지 않는 변수를 관리
```javascript
import { useRef, useEffect } from 'react';
 
function FocusInput() {
// 1. useRef를 사용하여 input 요소에 접근할 ref 생성
  const inputRef = useRef(null);
 
  useEffect(() => {
  // 2. 컴포넌트가 마운트되면 inputRef.current.focus() 실행
    inputRef.current.focus();
  }, []); // 빈 배열 → 최초 렌더링 시 한 번 실행
 
  return <input ref={inputRef} type="text" placeholder="자동 포커스" />;
}
```
ex) DOM 요소에 직접 접근해야 할 때 (Focus, Animation), 렌더링과 관계없는 값을 유지하고 싶을 때
### useReducer
> 상태 관리를 보다 구조적으로 할 수 있도록 도와주는 hook
> useState보다 복잡한 상태 업데이트 로직이 필요한 경우 사용
```javascript
import { useReducer } from 'react';
// 1. 초기 상태 설정 (count 초기값: 0)
const initialState = { count: 0 };
 
// 2. reducer 함수 정의 (state와 action을 받아 새로운 상태를 반환)
function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 }; // count 값을 1 증가
    case 'decrement':
      return { count: state.count - 1 }; // count 값을 1 감소
    default:
      throw new Error();  // 예상치 못한 action.type이 들어오면 에러 발생
  }
}
 
function Counter() {
  // 3. useReducer를 사용하여 state와 dispatch 함수를 가져옴
  //    - state: 현재 상태 값
  //    - dispatch: 액션을 발생시키는 함수 (reducer 함수 호출)
  const [state, dispatch] = useReducer(reducer, initialState);
  
  return (
    <div>
      <p>Count: {state.count}</p>
      {/* 4. dispatch를 사용해 액션을 보냄 */}
      <button onClick={() => dispatch({ type: 'increment' })}>+</button>
      <button onClick={() => dispatch({ type: 'decrement' })}>-</button>
    </div>
  );
}
```
ex) 상태 변경이 복잡한 경우 (여러 단계의 상태 변화 필요), Redux 스타일의 상태 관리가 필요할 때
### useEffect
> 컴포넌트의 라이프사이클(마운트, 업데이트, 언마운트) 동안 특정 동작을 수행할 수 있도록 도와주는 hook
```javascript
import { useState, useEffect } from 'react';
 
function Timer() {
// 1. useState를 사용하여 count 상태를 생성 (초기값: 0)
  const [count, setCount] = useState(0);
  
  useEffect(() => {
  // 2. 1초마다 count 값을 증가시키는 setInterval 설정
    const interval = setInterval(() => {
      setCount((prev) => prev + 1);
    }, 1000);
 
// 3. 컴포넌트가 언마운트될 때 clearInterval로 정리(cleanup)
    return () => clearInterval(interval);
  }, []); // 빈 배열 [] → 컴포넌트가 처음 마운트될 때만 실행됨
 
  return <p>타이머: {count}</p>;
}
```
ex) API 호출, 구독 설정, 타이머 등 부수 효과(side effect)가 필요한 경우
### useContext
> 전역 상태를 쉽게 공유할 수 있도록 도와주는 hook
```javascript
import { useContext, createContext } from 'react';
 
const ThemeContext = createContext('light');
 
function ThemedComponent() {
  const theme = useContext(ThemeContext);
  return <p>현재 테마: {theme}</p>;
}
```
ex) 부모-자식 간 전역적인 상태 공유가 필요할 때 (다크모드, 언어 설정 등, prop drilling을 피하고 싶을 때
<details>
<summary>**prop drilling 이란?**</summary>
	부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달할 때, 중간 단계의 컴포넌트이 필요하지 않은 props를 계속 전달해야 하는 문제. 해당 hook은 중간 컴포넌트가 props를 사용하지 않음에도 전달해야해서 코드가 지저분해지고 유지보수가 어려워지는 문제를 해결한다.
</details>
### useMemo
> 값의 연산 결과를 메모이제이션하여 불필요한 연산을 방지
```javascript
import { useState, useMemo } from 'react';
 
function ExpensiveCalculation({ number }) {
// 1. number 값이 바뀔 때만 연산을 수행 (useMemo 사용)
  const squared = useMemo(() => {
    console.log("Calculating..."); // 값이 변할 때만 로그 출력
    return number * number;
  }, [number]); // number가 바뀔 때만 실행됨
 
  return <p>계산된 값: {squared}</p>;
}
```
ex) 계산 비용이 높은 연산 (복잡한 수학 연산, 필터링 등), 특정 값이 변경될 때만 재계산해야 하는 경우
### useCallback
> 함수를 메모이제이션하여 불필요한 렌더링을 방지
```javascript
import { useState, useCallback } from 'react';
 
function Button({ onClick }) {
  return <button onClick={onClick}>클릭</button>;
}
 
function Parent() {
 // 1. useState를 사용해 count 상태 관리
  const [count, setCount] = useState(0);
  
  // 2. useCallback을 사용하여 handleClick 함수 생성 (최초 렌더링 시 1회만 생성됨)
 
  const handleClick = useCallback(() => {
    setCount(prev => prev + 1);
  }, []); // 의존성 배열이 빈 배열 → 컴포넌트가 처음 렌더링될 때 한 번만 생성됨
  
  return (
    <div>
      <p>Count: {count}</p>
      {/* 3. handleClick 함수가 변경되지 않으므로, Button 컴포넌트가 불필요하게 리렌더링되지 않음 */}
      <Button onClick={handleClick} />
    </div>
  );
}
```
ex) 자식 컴포넌트에 전달하는 함수가 재생성되는 것을 방지할 때, 리렌더링을 최소화해야 할 때
## 정리
<table header-row="true">
<colgroup>
<col width="110.65625">
<col width="153.65625">
<col width="290.65625">
<col width="217.03125">
</colgroup>
<tr>
<td>Hook</td>
<td>기능</td>
<td>사용 예시</td>
<td>적절한 사용 상황</td>
</tr>
<tr>
<td>useState</td>
<td>상태 관리 및 업데이트</td>
<td> const \[count, setCCount\] = useState(0);</td>
<td>간단한 상태 관리</td>
</tr>
<tr>
<td>useRef</td>
<td>DOM 요소 접근</td>
<td>const inputRef = useRef(null)</td>
<td>렌더링과 관계없는 값 유지</td>
</tr>
<tr>
<td>useReducer</td>
<td>복잡한 상태 관리</td>
<td>useReducer(reducer, initialState);</td>
<td>복잡한 상태 업데이트</td>
</tr>
<tr>
<td>useEffect</td>
<td>부수 효과 관리</td>
<td>useEffect(() ⇒ \{…\}, \[ \]);</td>
<td>API 효출, 타이머 설정</td>
</tr>
<tr>
<td>useContext</td>
<td>전역 상태 공유</td>
<td>useContext(MyContext);</td>
<td>전역상태 전달, prop drilling 방지</td>
</tr>
<tr>
<td>useMemo</td>
<td>값 메모이제이션</td>
<td>useMemo( () ⇒ compute( ), \[dps\]);</td>
<td>계산 비용이 높은 연산</td>
</tr>
<tr>
<td>useCallback</td>
<td>함수 메모이제이션</td>
<td>useCallback( () ⇒ \{…\}, \[deps\]);</td>
<td>불필요한 렌더링 방지</td>
</tr>
</table>
