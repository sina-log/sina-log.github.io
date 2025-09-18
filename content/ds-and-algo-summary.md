title=자료구조와 알고리즘, 코딩 테스트를 위한 핵심 정리 (Python & Java)
date=2023-10-27
type=post
tags=자료구조, 알고리즘, 코딩테스트, Python, Java
status=published
~~~~~~

코딩 테스트를 준비하다 보면 방대한 양의 자료구조와 알고리즘 개념 때문에 막막할 때가 많습니다. 특히 여러 프로그래밍 언어를 함께 사용한다면, 각 언어의 미묘한 차이점 때문에 헷갈리기 쉽습니다.

이 포스트는 코딩 테스트에 자주 등장하는 핵심적인 자료구조와 알고리즘을 **Python**과 **Java** 코드로 한눈에 비교하며 정리한 치트 시트입니다. 이 한 페이지로 흩어져 있던 지식을 체계적으로 정리하고, 시험 직전에 빠르게 복습하는 데 활용해 보세요.

## 1. 핵심 자료구조

코딩 테스트의 기본은 주어진 문제를 가장 효율적으로 해결할 수 있는 자료구조를 선택하는 것입니다.

### 1) 딕셔너리/HashMap & 세트/HashSet

키-값 쌍을 저장하거나 중복 없는 원소 집합을 다룰 때 사용합니다.

#### Python

```python
# 딕셔너리
char_counts = {}
text = "hello world"
for c in text:
    char_counts[c] = char_counts.get(c, 0) + 1

# defaultdict 사용
from collections import defaultdict
char_counts = defaultdict(int)
for c in text:
    char_counts[c] += 1

# 세트
numbers = [1, 2, 2, 3, 3, 3, 4]
unique_numbers = set(numbers)  # {1, 2, 3, 4}

# 집합 연산
set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}
print(set_a & set_b)  # 교집합: {3, 4}
print(set_a | set_b)  # 합집합: {1, 2, 3, 4, 5, 6}
print(set_a - set_b)  # 차집합: {1, 2}
```

#### Java

```java
// HashMap
Map<Character, Integer> charCount = new HashMap<>();
String text = "hello world";
for (char c : text.toCharArray()) {
    charCount.put(c, charCount.getOrDefault(c, 0) + 1);
}

// HashSet
Set<Integer> set = new HashSet<>(Arrays.asList(1, 2, 2, 3, 3, 3, 4));
// 자동으로 중복 제거됨: [1, 2, 3, 4]

// 집합 연산
Set<Integer> set1 = new HashSet<>(Arrays.asList(1, 2, 3, 4));
Set<Integer> set2 = new HashSet<>(Arrays.asList(3, 4, 5, 6));

// 교집합
Set<Integer> intersection = new HashSet<>(set1);
intersection.retainAll(set2);  // {3, 4}

// 합집합
Set<Integer> union = new HashSet<>(set1);
union.addAll(set2);  // {1, 2, 3, 4, 5, 6}

// 차집합
Set<Integer> difference = new HashSet<>(set1);
difference.removeAll(set2);  // {1, 2}
```

### 2) 리스트/ArrayList

순서가 있는 원소의 컬렉션을 다룰 때 가장 기본적으로 사용됩니다.

#### Python

```python
# 리스트
lst = []
lst.append(1)
lst.insert(0, 2)
lst.pop()
lst.pop(0)

# 리스트 컴프리헨션
squares = [x**2 for x in range(10)]

# 정렬
arr = [3, 1, 4, 1, 5]
arr.sort()  # 원본 정렬
sorted_arr = sorted(arr)  # 새 리스트 반환

# 커스텀 정렬
students = [("Alice", 90), ("Bob", 80)]
students.sort(key=lambda x: (-x[1], x[0]))
```

#### Java

```java
// ArrayList
List<Integer> list = new ArrayList<>();
list.add(1);
list.add(0, 2);
list.remove(list.size() - 1);
list.remove(0);

// 정렬
Collections.sort(list);
Collections.sort(list, Collections.reverseOrder());

// 커스텀 정렬
List<int[]> students = new ArrayList<>();
students.sort((a, b) -> {
    if (a[1] != b[1]) return b[1] - a[1];
    return a[0] - b[0];
});
```

### 3) 스택/Stack & 큐/Queue

후입선출(LIFO)과 선입선출(FIFO) 로직을 구현할 때 사용합니다.

#### Python

```python
# 스택 (리스트 사용)
stack = []
stack.append(1)
print(stack.pop())

# 큐 (deque 사용)
from collections import deque
queue = deque()
queue.append(1)
print(queue.popleft())
```

#### Java

```java
// Stack
Stack<Integer> stack = new Stack<>();
stack.push(1);
System.out.println(stack.pop());

// Queue
Queue<Integer> queue = new LinkedList<>();
queue.offer(1);
System.out.println(queue.poll());
```

### 4) 우선순위 큐/PriorityQueue

가장 크거나 작은 원소를 빠르게 찾아야 할 때 유용합니다.

#### Python

```python
import heapq

# 최소 힙
min_heap = []
heapq.heappush(min_heap, 4)
heapq.heappush(min_heap, 1)
print(heapq.heappop(min_heap))  # 1

# 최대 힙 (음수로 변환)
max_heap = []
heapq.heappush(max_heap, -4)
heapq.heappush(max_heap, -1)
print(-heapq.heappop(max_heap)) # 7
```

#### Java

```java
// 최소 힙
PriorityQueue<Integer> minHeap = new PriorityQueue<>();
minHeap.offer(4);
minHeap.offer(1);
System.out.println(minHeap.poll());  // 1

// 최대 힙
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
maxHeap.offer(4);
maxHeap.offer(1);
maxHeap.offer(7);
System.out.println(maxHeap.poll());  // 7
```

## 2. 핵심 알고리즘

자료구조를 선택했다면, 이제 문제를 풀기 위한 알고리즘을 적용할 차례입니다.

### 1) 이진 탐색 (Binary Search)

정렬된 배열에서 특정 값을 빠르게 찾을 때 사용합니다.

#### Python

```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: left = mid + 1
        else: right = mid - 1
    return -1

# bisect 모듈
import bisect
arr = [1, 2, 4, 4, 5]
print(bisect.bisect_left(arr, 4))   # 2
print(bisect.bisect_right(arr, 4))  # 4
```

#### Java

```java
public static int binarySearch(int[] arr, int target) {
    int left = 0, right = arr.length - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}

// Arrays.binarySearch() 활용
int index = Arrays.binarySearch(new int[]{1, 2, 4, 4, 5}, 4);
```

### 2) 깊이 우선 탐색 (DFS) & 너비 우선 탐색 (BFS)

그래프의 모든 노드를 방문할 때 사용하는 대표적인 두 가지 방법입니다.

#### Python

```python
# DFS (재귀)
def dfs_recursive(node, graph, visited):
    visited.add(node)
    for neighbor in graph.get(node, []):
        if neighbor not in visited:
            dfs_recursive(neighbor, graph, visited)

# BFS
from collections import deque
def bfs(start, graph):
    visited = {start}
    queue = deque([start])
    while queue:
        node = queue.popleft()
        for neighbor in graph.get(node, []):
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
```

#### Java

```java
// DFS (재귀)
public void dfsRecursive(int node, Map<Integer, List<Integer>> graph, Set<Integer> visited) {
    visited.add(node);
    for (int neighbor : graph.getOrDefault(node, new ArrayList<>())) {
        if (!visited.contains(neighbor)) {
            dfsRecursive(neighbor, graph, visited);
        }
    }
}

// BFS
public void bfs(int start, Map<Integer, List<Integer>> graph) {
    Set<Integer> visited = new HashSet<>();
    Queue<Integer> queue = new LinkedList<>();
    visited.add(start);
    queue.offer(start);
    while (!queue.isEmpty()) {
        int node = queue.poll();
        for (int neighbor : graph.getOrDefault(node, new ArrayList<>())) {
            if (!visited.contains(neighbor)) {
                visited.add(neighbor);
                queue.offer(neighbor);
            }
        }
    }
}
```

### 3) 동적 계획법 (Dynamic Programming)

복잡한 문제를 작은 하위 문제로 나누어 해결하는 기법입니다.

#### Python

```python
# Top-Down (메모이제이션)
memo = {}
def fib_memo(n):
    if n <= 1: return n
    if n in memo: return memo[n]
    memo[n] = fib_memo(n-1) + fib_memo(n-2)
    return memo[n]

# Bottom-Up
def fib_tab(n):
    dp = [0, 1] + [0] * (n - 1)
    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]

# @lru_cache 활용
from functools import lru_cache
@lru_cache(maxsize=None)
def fib_lru(n):
    if n <= 1: return n
    return fib_lru(n-1) + fib_lru(n-2)
```

#### Java

```java
// Top-Down (메모이제이션)
private Map<Integer, Integer> memo = new HashMap<>();
public int fibMemo(int n) {
    if (n <= 1) return n;
    if (memo.containsKey(n)) return memo.get(n);
    int result = fibMemo(n - 1) + fibMemo(n - 2);
    memo.put(n, result);
    return result;
}

// Bottom-Up
public static int fibTab(int n) {
    if (n <= 1) return n;
    int[] dp = new int[n + 1];
    dp[1] = 1;
    for (int i = 2; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}
```

## 3. 기타 유용한 팁

알고리즘 외에도 코딩 테스트에 유용한 자잘한 팁들입니다.

### 1) 입출력 최적화

많은 양의 입력을 처리해야 할 때 시간 초과를 방지할 수 있습니다.

#### Python

```python
import sys
input = sys.stdin.readline
n = int(input())
arr = list(map(int, input().split()))
```

#### Java

```java
import java.io.*;
import java.util.*;

BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
StringTokenizer st = new StringTokenizer(br.readLine());
int n = Integer.parseInt(st.nextToken());
```

### 2) 방향 배열

2D 격자 탐색 문제에서 상하좌우 또는 8방향 이동을 간결하게 처리할 수 있습니다.

#### Python & Java 공통

```python
# Python
dx = [-1, 1, 0, 0]  # 상하좌우
dy = [0, 0, -1, 1]

for i in range(4):
    nx, ny = x + dx[i], y + dy[i]
    # ... 범위 체크 및 로직 ...
```

```java
// Java
int[] dx = {-1, 1, 0, 0}; // 상하좌우
int[] dy = {0, 0, -1, 1};

for (int i = 0; i < 4; i++) {
    int nx = x + dx[i];
    int ny = y + dy[i];
    // ... 범위 체크 및 로직 ...
}
```

## 마무리

이 포스트에서 다룬 내용들은 코딩 테스트의 시작점입니다. 각 자료구조와 알고리즘의 시간 복잡도와 공간 복잡도를 이해하고, 다양한 문제에 적용하는 연습을 꾸준히 하는 것이 중요합니다.

행운을 빕니다!
