import Foundation

public class MaxHeap <Element: Comparable> {
    
    private var heapArray = [Element]()

    public var count: Int { heapArray.count }
    public var isEmpty: Bool { heapArray.isEmpty }

    public init() { }

    public func build(from array: [Element]) {
        heapArray = array
        for i in stride(from: (heapArray.count / 2) - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }

    public func insert(_ element: Element) {
        heapArray.append(element)
        siftUp(heapArray.count - 1)
    }

    public func peek() -> Element? { heapArray.first }

    public func extractMax() -> Element? {
        if heapArray.isEmpty { return nil }
        heapArray.swapAt(0, heapArray.count - 1)
        let value = heapArray.removeLast()
        siftDown(from: 0)
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

    private func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2

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
}
