import Foundation

public protocol BinaryHeap {
    associatedtype T: Comparable
    var count: Int { get }
    func insert(_ value: T)
    func peek() -> T?
    func extract() -> T?
}
