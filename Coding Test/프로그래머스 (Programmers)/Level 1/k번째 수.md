```python
def solution(array, commands):
    answer = []
    for i in range(len(commands)):
        cut_arr = array[commands[i][0] - 1:commands[i][1]]
        cut_arr.sort()
        answer.append(cut_arr[commands[i][2] - 1])

    return answer
```
