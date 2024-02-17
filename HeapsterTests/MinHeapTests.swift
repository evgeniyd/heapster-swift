//
//  HeapsterTests.swift
//  LCDTTests
//
//  Created by Yevhen Dubinin on 2/16/24.
//

import XCTest
import Heapster

class MinHeapTests: XCTestCase {

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

    func test_peek_returnsMinValueOnBuildMultipleElementsHeap() throws {
        var sut = makeSUT()

        let dataSet:[[Int]: Int] = [
            [1,2]: 1,
            [3,1,2]: 1,
            [4,1,2,3]: 1,
            [8,10,2,3]: 2,
        ]

        for (input, expectedValue) in dataSet {
            sut.build(from: input)
            let returnedValue = try XCTUnwrap(sut.peek())
            XCTAssertEqual(returnedValue, expectedValue)
        }
    }

    func test_peek_returnsMinValueOnBuildSameElements() throws {
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
        let expectedValue = 2

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

    // MARK: extractMin()

    func test_extractMin_returnsNilOnInitHeap() {
        var sut = makeSUT()

        let value = sut.extractMin()

        XCTAssertNil(value)
    }

    func test_extractMin_returnsNilOnEmptyHeap() {
        var sut = makeSUT()
        sut.build(from: [])

        let value = sut.extractMin()

        XCTAssertNil(value)
    }

    func test_extractMin_returnsEmptyCountOnSingleSizeHeap() {
        var sut = makeSUT()
        let input = [1]

        sut.build(from: input)
        let _ = sut.extractMin()

        XCTAssertEqual(sut.count, 0)
    }

    func test_extractMin_returnsSameValueOnSingleSizeHeap() throws {
        var sut = makeSUT()
        let input = [1]
        let expectedValue = 1

        sut.build(from: input)
        let returnedValue = try XCTUnwrap(sut.extractMin())

        XCTAssertEqual(expectedValue, returnedValue)
    }

    func test_extractMin_decreasesCountOfElements() {
        var sut = makeSUT()
        let input = [1,3,5]
        let expectedCount = input.count - 1

        sut.build(from: input)
        let _ = sut.extractMin()

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_extractMin_returnsMinValue() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        let expectedValues = [1,2,3,5]

        sut.build(from: input)

        for i in 0..<expectedValues.count {
            let expectedValue = expectedValues[i]
            let returnedValue = try XCTUnwrap(sut.extractMin())
            XCTAssertEqual(expectedValue, returnedValue)
        }
    }

    func test_extractMin_returnsNilAfterExtractingAllValues() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        var count = input.count

        sut.build(from: input)
        while count > 0 {
            let _ = sut.extractMin()
            count -= 1
        }

        let value = sut.extractMin()
        XCTAssertNil(value)
    }

    func test_extractMin_returnsMinValueAfterMinElementInsert() throws {
        var sut = makeSUT()
        let input = [3,5,2,1]
        let expectedValue = 0

        sut.build(from: input)
        sut.insert(expectedValue)

        let returnedValue = try XCTUnwrap(sut.extractMin())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    func test_extractMin_returnsMinValueAfterNextToMinElementInsert() throws {
        var sut = makeSUT()
        let input = [3,5,1]
        let expectedValue = 1
        let insertedValue = 2

        sut.build(from: input)
        sut.insert(insertedValue)

        let returnedValue = try XCTUnwrap(sut.extractMin())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    func test_extractMin_returnsMinValueAfterMultiElementInsert() throws {
        var sut = makeSUT()
        let input = [3,5,1]
        let expectedValue = 1
        let insertedValues = [8,4,6]

        sut.build(from: input)

        for ie in insertedValues {
            sut.insert(ie)
        }

        let returnedValue = try XCTUnwrap(sut.extractMin())
        XCTAssertEqual(returnedValue, expectedValue)
    }

    // MARK: insert()

    func test_insert_increasesCountOnSingleElementInsert() {
        var sut = makeSUT()
        let expectedCount = 1

        sut.insert(1)

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_insert_increasesCountOnMultiElementsInsert() {
        var sut = makeSUT()
        let insertedElements = [4,2,7]
        let expectedCount = insertedElements.count

        for ie in insertedElements{
            sut.insert(ie)
        }

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_insert_increasesCountOnSameElementInserts() {
        var sut = makeSUT()
        let insertedElements = [1,1,1,1]
        let expectedCount = insertedElements.count

        for ie in insertedElements{
            sut.insert(ie)
        }

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_insert_increasesCountAfterBuild() {
        var sut = makeSUT()
        let input = [3,4,2]
        sut.build(from: input)

        let expectedCount = input.count + 1

        sut.insert(1)

        XCTAssertEqual(sut.count, expectedCount)
    }

    func test_insert_increasesCountAfterBuildAndInsertingExistingElement() {
        var sut = makeSUT()
        let input = [3,4,2]
        sut.build(from: input)

        let expectedCount = input.count + 1

        sut.insert(3)

        XCTAssertEqual(sut.count, expectedCount)
    }

    // MARK: Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MinHeap<Int> {
        let sut = MinHeap<Int>()
        return sut
    }
}
