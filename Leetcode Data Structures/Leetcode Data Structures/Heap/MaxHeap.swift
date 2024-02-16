import Foundation

public class MaxHeap <Element: Comparable> {
    
    private var heapArray = [Element]()

    public var count: Int {
        return heapArray.count
    }

    public init() {
        // this is public init
    }

    public func insert(_ element: Element) {
        heapArray.append(element)
        siftUp(heapArray.count - 1)
    }

    public func peek() -> Element? {
        if heapArray.isEmpty { return nil }
        return heapArray.last!
    }

    public func extractMax() -> Element? {
        if heapArray.isEmpty { return nil }
        heapArray.swapAt(0, heapArray.count - 1)
        let value = heapArray.removeLast()
        siftDown(0)
        return value
    }

    private func siftUp(_ index: Int) {
        var childIndex = index // left child: 2i+1; right child:  2i + 2
        var parentIndex = parentIndex(of: childIndex)
        while childIndex > 0 && heapArray[childIndex] > heapArray[parentIndex] {
            heapArray.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }

    private func siftDown(_ index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex) // 2i + 1
            let rightChildIndex = leftChildIndex + 1 // 2i + 2

            var candidateIndex = parentIndex
            if leftChildIndex < heapArray.count && heapArray[leftChildIndex] > heapArray[candidateIndex] {
                candidateIndex = leftChildIndex
            }

            if rightChildIndex < heapArray.count && heapArray[rightChildIndex] > heapArray[candidateIndex] {
                candidateIndex = rightChildIndex
            }

            if candidateIndex == parentIndex { break }

            heapArray.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2 // derived from left child index 2i + 1
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    public var description: String {
        return heapArray.map { "\($0)" }.joined(separator: ", ")
    }
}

extension MaxHeap: CustomStringConvertible {
    public var debugDescription: String {
        return "[\(description)]"
    }
}

extension MaxHeap: BinaryHeap {
    public func extract() -> Element? {
        return extractMax()
    }
}
