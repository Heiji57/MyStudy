# DFS(Depth-First Search)
> 최대한 깊게 내려간 뒤에, 더 이상 갈 곳이 없을 경우 옆으로 이동
> 루트 노드에서 시작해서 다음 분기로 넘어가기 전에 해당 분기를 완벽하게 탐색하는 방식을 말함.
> >
> ex) 미로찾기를 할 때 최대한 한 방향으로 갈 수 있을 때까지 쭉 가다가 더 이상 갈 수 없게 되면 다시 가장 가까운 갈림길로 돌아와서 그 갈림길부터 다시 다른 방향으로 탐색을 진행하는 것.
> 1. 모든 노드를 방문하고자 하는 경우에 사용
> 2. DFS가 BFS보다 좀 더 간단함.
> 3. 검색 속도 자체는 BFS보다 느림
![](https://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif)
> > **DFS 코드 작성 3단계 공식**
> 매개변수 - 나한태 필요한 정보는?
> 종료조건 - 언제 멈출것인가?
> 수행 로직 - 어떤 선택을 하고 다음으로 넘어갈 것인가?
# BFS (Breadth-First Search)
![](https://upload.wikimedia.org/wikipedia/commons/5/5d/Breadth-First-Search-Algorithm.gif)
> 루트 노드에서 시작해서 인접한 노드를 먼저 탐색하는 방법으로, 시작 정점으로부터 가까운 정점을 먼저 방문하고 멀리 떨어져 있는 정점을 나중에 방문하는 순회 방법.
> 주로 두 노드 사이의 최단 경로를 찾을 때 많이 사용한다.
> > ex) 지구 상에 존재하는 모든 친구 관계를 그래프로 표현한 후 Sam과 Eddie사이에 존재하는 경로를 찾는 경우
> - DFS - 모든 친구 관계를 다 살펴봐야 할 수도 있음.
> - BFS - Sam과 가까운 관계부터 탐색.
# DFS & BFS 비교
![](https://blog.kakaocdn.net/dna/cQYkI8/btqB8oDsMGe/AAAAAAAAAAAAAAAAAAAAAAqanyYtMUKWrUqhsUM86dwnQU77h6zq2FWd8SpTROMR/img.gif?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1790780399&allow_ip=&allow_referer=&signature=cizgLpHubDBFW3McQMrKHSCWycM%3D)
<table header-row="true">
<colgroup>
<col width="239.66666666666666">
<col width="239.66666666666666">
</colgroup>
<tr>
<td>DFS</td>
<td>BFS</td>
</tr>
<tr>
<td>현재 정점에서 갈 수 있는 점들까지 들어가면서 탐색</td>
<td>현재 정점에 연결된 가까운 점들부터 탐색</td>
</tr>
<tr>
<td>스택 또는 재귀함수로 구현</td>
<td>큐를 이용해서 구현</td>
</tr>
</table>
## DFS & BFS 시간복잡도
> 두 방식 모두 조건 내의 모든 노드를 검색한다는 점에서 시간 복잡도는 동일
> DFS와 BFS 둘 다 다음 노드가 방문하였는지를 확인하는 시간과 각 노드를 방문하는 시간을 합하면 됨.

> N은 노드, E는 간선일 때
	**인접 리스트** : O(N+E)
	**인접 행렬** : O(N²)
## DFS & BFS 활용 문제
> DFS, BFS는 특징에 따라 사용에 더 적합한 문제 유형들이 있다.
> <br>1) 그래프의 모든 정점을 방문하는 것이 중요한 문제<br>→ 상관없음.
> 2) 경로의 특징을 저장해둬야 하는 문제<br>ex) 각 정점에 숫자가 적혀있고, a부터 b까지 가는 가능 경로를 구하는데 경로에 같은 숫자가 있으면 안 된다는 문제 등<br>→ DFS를 사용 (BFS는 경로의 특징을 가지지 못 함)
> 3) 최단거리 구해야 하는 문제<br>ex) 미로 찾기 등<br>→ BFS를 사용
> 이외에도 
> 검색 대상 그래프가 정말 큰 경우 → DFS를 고려
> 검색 대상의 규모가 크지 않고, 검색 시작 지점으로부터 원하는 대상이 별로 멀지 않은 경우 → BFS
# DFS & BFS Python 코드
## DFS 코드
```python
def dfs(graph, v, visited):
    # 현재 노드(v)를 방문 처리
    visited[v] = True
    print(v, end=' ') # 방문한 노드의 번호를 출력
    # 현재 노드(v)와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v]:
        if not visited[i]:
            dfs(graph, i, visited)

#각 노드가 연결된 정보를 리스트 자료형으로 표현(2차원 리스트)
graph = [
    [],
    [2, 3, 8], # 1번 노드와 연결된 노드
    [1, 7], # 2번 노드와 연결된 노드
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

#각 노드가 방문된 정보를 리스트 자료형으로 표현(1차원 리스트)
visited = [False]*9 
#0번 인덱스를 사용하지 않기 위해 요소를 9개로 설정
#False : 노드를 미방문한 상태

#정의된 DFS 함수 호출
dfs(graph, 1, visited)
```
## BFS 코드
```python
from collections import deque

#BFS 메서드 정의
def bfs(graph, start, visited):
    #큐(queue) 구현을 위한 deque 라이브러리 사용
    queue = deque([start])
    #현재 노드를 방문 처리
    visited[start] = True
    
    #큐가 빌 때까지 반복
    while queue:
        #큐에서 하나의 원소를 뽑아 출력(popleft = 제거)
        v = queue.popleft()
        print(v, end=' ')
        #해당 원소와 연결된, 아직 방문하지 않은 원소들을 큐에 삽입
        for i in graph[v]:
            if not visited[i]:
                queue.append(i)
                visited[i] = True

#각 노드와 연결된 정보를 리스트 자료형으로 표현 (2차원 리스트)
graph = [
    [],
    [2, 3, 8], # 1번 노드와 연결된 노드
    [1, 7], # 2번 노드와 연결된 노드
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

# 각 노드가 방문된 정보를 리스트 자료형으로 표현(1차원 리스트)
visited = [False]*9 
# 0번 인덱스를 사용하지 않기 위해 요소를 9개로 설정
# False : 노드를 미방문한 상태

# 정의된 DFS 함수 호출
bfs(graph, 1, visited)
```
