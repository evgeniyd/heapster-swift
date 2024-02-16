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
        guard let maxValue = self.peek() else {
            return nil
        }

        heapArray[0] = heapArray.last!
        heapArray.removeLast()

        siftDown(from: 0)

        return maxValue;
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < heapArray.count && heapArray[left] < heapArray[candidate] {
                candidate = left
            }

            if right < heapArray.count && heapArray[right] < heapArray[candidate] {
                candidate = right
            }

            if candidate == parent {
                return
            }

            heapArray.swapAt(parent, candidate)
            parent = candidate
        }
    }

    private mutating func siftUp(from index: Int) {
        var index = index
        while (index > 0) {
            // Get parent node using the rule that is oposite to Left: 2i+1 Right: 2i+2
            // 2x+1 = y; 2x = y-1; x = (y-1) / 2, where y index of the element to the left of the parent
            // 2x+2 = y; 2x = y -2; x = (y - 2) / 2,
            let parentIndex = (index - 1) / 2
            if (heapArray[index] < heapArray[parentIndex]) {
                // move the NEW node up
                heapArray.swapAt(index, parentIndex)
                // update index, as we moved one level up in the tree
                index = parentIndex
            } else {
                break;
            }
        }
    }
}
