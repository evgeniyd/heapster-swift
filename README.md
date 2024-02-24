# Heaps

[MaxHeap.swift](Heapster/MaxHeap.swift)

[MinHeap.swift](Heapster/MinHeap.swift)

The [Documentation](Heapster/Heapster.docc/Heapster.md) with more info.

# Problem

**Heap** is the data structure that I often has to drop into my [Leetcode](https://leetcode.com) solutions. I implemented `MinHeap` and `MaxHeap` for educational purpose from scratch once, and started using it for Leetcode problems. This project exists so one can quickly copy-and-paste a Heap to a [Swift] Leetcode solutions.

# Goals

1. Simple AF
2. Tested
3. Minificated (Less lines of code)
4. Performant enough

# Notes:

* Code is duplicated on purpose: the idea is one uses either [MaxHeap](Heapster/MaxHeap.swift) or [MinHeap](Heapster/MinHeap.swift) by copying and pasting the source code into Leetcode code editor.
* API of both Heaps is unified, except `extractMin()` vs. `extractMax()` to be more descriptive. It is a personal choice.
* I am toying with this idea of minifying the source code, and creating a release versions of it. Similar to how minification is often done with JavaScript. In the end of the day, for the goals of this project, the code should not be readable as far as it delivers expected behavior.

# TODO

- [x] Add test to `MinHeap`
- [x] Add tests to `MaxHeap`
- [ ] Script to minify `MinHeap`
- [ ] Script to minify `MaxHeap`
- [ ] Move code comments to the documentation
- [ ] Add performance tests

![Repo image](/github-image.png)

# Leetcode
Problems that *can* be solved with `Heap` data structure.

* [1481. Least Number of Unique Integers after K Removals](https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/) | [Solution](https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/solutions/4749396/heap-solution/)
* [1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach/) | [Solution](https://leetcode.com/problems/furthest-building-you-can-reach/solutions/4749423/minheap-solution/)
* [2402. Meeting Rooms III](https://leetcode.com/problems/meeting-rooms-iii/) | [Solution](https://leetcode.com/problems/meeting-rooms-iii/solutions/4748798/2-solutions-linear-search-two-heaps/)
