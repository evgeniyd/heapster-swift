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

    // MARK: Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MaxHeap<Int> {
        let sut = MaxHeap<Int>()
        return sut
    }
}
