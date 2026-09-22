```python
def solution(citations):
    citations.sort(reverse=True)
    answer = 0
    for i in range(len(citations)):
        if citations[i] >= i + 1:
            answer =  i + 1
        else:
            break
    return answer
```
> **배운점 & 느낀점**
	- 반대로 비교하는 걸 이용하니까 시간 복잡도가 해결됨
