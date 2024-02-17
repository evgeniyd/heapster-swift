import Foundation

public struct MinHeap <Element: Comparable> {
    private var heapArray: [Element] = []

    public var count: Int { heapArray.count }
    public var isEmpty: Bool { heapArray.isEmpty }

    public init() { }

    public mutating func build(from array: [Element]) {
        heapArray = array
        for i in stride(from: (heapArray.count / 2) - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }
    
    public mutating func insert(_ element: Element) {
        heapArray.append(element)
        siftUp(from: heapArray.count - 1)
    }

    public func peek() -> Element? { heapArray.first }

    public mutating func extractMin() -> Element? {
        guard let minValue = self.peek() else {
            return nil
        }

        heapArray[0] = heapArray.last!
        heapArray.removeLast()

        siftDown(from: 0)

        return minValue;
    }

    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var candidateIndex = parentIndex

            if leftChildIndex < heapArray.count && heapArray[leftChildIndex] < heapArray[candidateIndex] {
                candidateIndex = leftChildIndex
            }

            if rightChildIndex < heapArray.count && heapArray[rightChildIndex] < heapArray[candidateIndex] {
                candidateIndex = rightChildIndex
            }

            if candidateIndex == parentIndex { break }

            heapArray.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        while (childIndex > 0) {
            let parentIndex = (childIndex - 1) / 2
            if (heapArray[childIndex] < heapArray[parentIndex]) {
                heapArray.swapAt(childIndex, parentIndex)
                childIndex = parentIndex
            } else {
                break;
            }
        }
    }
}
