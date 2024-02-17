//
//  MaxHeapTests.swift
//  HeapsterTests
//
//  Created by Yevhen Dubinin on 2/17/24.
//

import XCTest
import Heapster

class MaxHeapTests: XCTestCase {

    // MARK: init()

    func test_init_heapCountEqualsZeroOnInit() {
        let sut = makeSUT()
        XCTAssertEqual(sut.count, 0)
    }

    // MARK: build()

    func test_build_emptyWhenBuiltWithEmptyArray() {
        var sut = makeSUT()

        sut.build(from: [])

        XCTAssertEqual(sut.count, 0)
    }

    func test_build_hasCountOfElements() {
        var sut = makeSUT()

        let dataSet: [[Int]] = [
            [1],
            [1,2],
            [1,2,3]
        ]

        for ds in dataSet {
            let expectedCount = ds.count
            sut.build(from: ds)
            XCTAssertEqual(sut.count, expectedCount)
        }
    }

    // MARK: isEmpty

    func test_isEmpty_returnsEmptyOnInit() {
        let sut = makeSUT()
        XCTAssertEqual(sut.isEmpty, true)
    }

    func test_isEmpty_returnsEmptyOnBuildWithNoElements() {
        var sut = makeSUT()

        sut.build(from: [])

        XCTAssertEqual(sut.isEmpty, true)
    }

    func test_isEmpty_returnsNotEmptyOnBuildWithSingleElement() {
        var sut = makeSUT()

        sut.build(from: [1])

        XCTAssertEqual(sut.isEmpty, false)
    }

    func test_isEmpty_returnsNotEmptyOnBuildWithMultiElements() {
        var sut = makeSUT()

        sut.build(from: [1,2,3])

        XCTAssertEqual(sut.isEmpty, false)
    }

    func test_isEmpty_returnsNotEmptyOnInsertSingleElement() {
        var sut = makeSUT()

        sut.insert(1)

        XCTAssertEqual(sut.isEmpty, false)
    }

    func test_isEmpty_returnsNotEmptyOnInsertMultiElements() {
        var sut = makeSUT()

        sut.insert(1)
        sut.insert(2)
        sut.insert(3)

        XCTAssertEqual(sut.isEmpty, false)
    }

    // MARK: peek()

    func test_peek_returnsNilOnInitHeap() {
        let sut = makeSUT()

        let value = sut.peek()

        XCTAssertNil(value)
    }

    func test_peek_returnsNilOnBuildEmptyHeap() {
        var sut = makeSUT()
        let input: [Int] = []

        sut.build(from: input)

        XCTAssertNil(sut.peek())
    }

    func test_peek_returnsNilOnBuildSingleElementHeap() throws {
        var sut = makeSUT()
        let input: [Int] = [1]
        let expectedValue = 1

        sut.build(from: input)

        let returnedValue = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    func test_peek_returnsMaxValueOnBuildMultipleElementsHeap() throws {
        var sut = makeSUT()

        let dataSet:[[Int]: Int] = [
            [1,2]: 2,
            [3,1,2]: 3,
            [4,1,2,3]: 4,
            [8,10,2,3]: 10,
        ]

        for (input, expectedValue) in dataSet {
            sut.build(from: input)
            let returnedValue = try XCTUnwrap(sut.peek())
            XCTAssertEqual(returnedValue, expectedValue)
        }
    }

    func test_peek_returnsMaxValueOnBuildSameElements() throws {
        var sut = makeSUT()
        let dataSet:[[Int]: Int] = [
            [1,1]: 1,
            [2,2,2]: 2,
            [4,4,4,4]: 4,
            [10,10,10,10]: 10,
        ]

        for (input, expectedValue) in dataSet {
            sut.build(from: input)
            let returnedValue = try XCTUnwrap(sut.peek())
            XCTAssertEqual(returnedValue, expectedValue)
        }
    }

    func test_peek_hasNoSideEffectsOnBuildSingleElementHeap() throws {
        var sut = makeSUT()
        let input = [1]

        sut.build(from: input)

        let returnedValue1 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue1, 1)
        let returnedValue2 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue2, 1)
    }

    func test_peek_hasNoSideEffectsOnBuildMultiElementsHeap() throws {
        var sut = makeSUT()
        let input = [8,4,2]
        let expectedCount = input.count
        let expectedValue = 8

        sut.build(from: input)

        let returnedValue1 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue1, expectedValue)
        XCTAssertEqual(sut.count, expectedCount)
        let returnedValue2 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue2, expectedValue)
        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_peek_hasNoSideEffectsOnBuildSameElementsHeap() throws {
        var sut = makeSUT()
        let input = [8,8,8]
        let expectedCount = input.count
        let expectedValue = 8

        sut.build(from: input)

        let returnedValue1 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue1, expectedValue)
        XCTAssertEqual(sut.count, expectedCount)
        let returnedValue2 = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue2, expectedValue)
        XCTAssertEqual(sut.count, expectedCount)
    }

    // MARK: extractMax()

    func test_extractMax_returnsNilOnInitHeap() {
        var sut = makeSUT()

        let value = sut.extractMax()

        XCTAssertNil(value)
    }

    func test_extractMax_returnsNilOnBuildEmptyHeap() {
        var sut = makeSUT()
        sut.build(from: [])

        let value = sut.extractMax()

        XCTAssertNil(value)
    }

    func test_extractMax_returnsEmptyCountOnBuildSingleElementHeap() {
        var sut = makeSUT()
        let input = [1]
        let expectedCount = 0

        sut.build(from: input)
        let _ = sut.extractMax()

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_extractMax_decreasesCountOnBuildMultipleElementsHeap() {
        var sut = makeSUT()
        let input = [1,3,5]
        let expectedCount = input.count - 1

        sut.build(from: input)
        let _ = sut.extractMax()

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_extractMax_returnsMaxValueOnBuildSingleElementHeap() throws {
        var sut = makeSUT()
        let input = [1]
        let expectedValue = 1

        sut.build(from: input)
        let returnedValue = try XCTUnwrap(sut.extractMax())

        XCTAssertEqual(expectedValue, returnedValue)
    }

    func test_extractMax_returnsMaxValueOnBuildMultipleElementsHeap() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        let expectedValues = [5,3,2,1]

        sut.build(from: input)

        for i in 0..<expectedValues.count {
            let expectedValue = expectedValues[i]
            let returnedValue = try XCTUnwrap(sut.extractMax())
            XCTAssertEqual(expectedValue, returnedValue)
        }
    }

    func test_extractMax_returnsNilAfterExtractingAllValues() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        var count = input.count

        sut.build(from: input)
        while count > 0 {
            let _ = sut.extractMax()
            count -= 1
        }

        let value = sut.extractMax()
        XCTAssertNil(value)
    }

    func test_extractMin_returnsMaxValueAfterMaxElementInsert() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        let expectedValue = 8

        sut.build(from: input)
        sut.insert(expectedValue)

        let returnedValue = try XCTUnwrap(sut.extractMax())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    func test_extractMax_returnsMaxValueAfterNextToMaxElementInsert() throws {
        var sut = makeSUT()
        let input = [3,5,1]
        let expectedValue = 5
        let insertedValue = 4

        sut.build(from: input)
        sut.insert(insertedValue)

        let returnedValue = try XCTUnwrap(sut.extractMax())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    func test_extractMax_returnsMaxValueAfterMultiElementsInsert() throws {
        var sut = makeSUT()
        let input = [8,4,6]
        let expectedValue = 8
        let insertedValues = [3,5,1]

        sut.build(from: input)

        for ie in insertedValues {
            sut.insert(ie)
        }

        let returnedValue = try XCTUnwrap(sut.extractMax())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    // MARK: Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MaxHeap<Int> {
        let sut = MaxHeap<Int>()
        return sut
    }
}
