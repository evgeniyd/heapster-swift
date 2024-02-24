# ``Heapster``

Drop-in `MinHeap` and `MaxHeap` for [Leetcode Problems](https://leetcode.com/problems/) written and tested in Swift.

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Topics

### Custom `Element`

`MinHeap` and `MaxHeap` are implemented as [Swift Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/), and so both support custom `Element` type. 

You just need to conform to [`Comparable` protocol](https://developer.apple.com/documentation/swift/comparable) and to specify what state will be used to maintain the Min/Max Heap property. See the example below:

```
struct Arrival: Comparable {
    let train: Int
    let time: Int

    static func < (lhs: Int, rhs: Int) -> Bool {
        lhs.time < rhs.time
    }
} 
```

Notice, that we picket `time` property to compare, and extract the Min/Max `Arrival` value based on that.

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
