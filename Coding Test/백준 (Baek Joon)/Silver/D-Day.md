```python
import sys


def solve():
    firstYear, firstMonth, firstDay = map(int, sys.stdin.readline().split())
    secondYear, secondMonth, secondDay = map(int, sys.stdin.readline().split())

    if secondYear > firstYear + 1000 or (secondYear == firstYear + 1000 and (secondMonth, secondDay) >= (firstMonth, firstDay)):
        return "gg"

    import datetime
    firstDate = datetime.date(firstYear, firstMonth, firstDay)
    secondDate = datetime.date(secondYear, secondMonth, secondDay)

    diff = secondDate - firstDate

    return "D-" + str(diff.days)

if __name__ == '__main__':
    print(solve())
```
> **배운점 & 느낀점**
	python에서 date type을 받고 사용하는 방법을 알게됨. 
	반례를 좀 더 잘 생각해야될 것 같다.
