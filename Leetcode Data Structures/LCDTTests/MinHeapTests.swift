//
//  MinHeapTests.swift
//  LCDTTests
//
//  Created by Yevhen Dubinin on 2/16/24.
//

import XCTest
import LCDT

class MinHeapTests: XCTestCase {

    // MARK: init()

    func test_init_heapIsEmptyOnInit() {
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

    // MARK: peek()

    func test_peek_returnsNilOnInitHeap() {
        var sut = makeSUT()

        let value = sut.peek()

        XCTAssertNil(value)
    }

    func test_peek_returnsNilOnEmptyHeap() {
        var sut = makeSUT()
        let input: [Int] = []

        sut.build(from: input)

        XCTAssertNil(sut.peek())
    }

    func test_peek_returnsMinValueOnDifferentElements() throws {
        var sut = makeSUT()
        let input = [3,1,2]
        
        sut.build(from: input)

        let returnedValue = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue, 1)
    }

    func test_peek_returnsMinValueOnSameElements() throws {
        var sut = makeSUT()
        let input = [1,1,1]

        sut.build(from: input)

        let returnedValue = try XCTUnwrap(sut.peek())
        XCTAssertEqual(returnedValue, 1)
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

    // MARK: Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MinHeap<Int> {
        let sut = MinHeap<Int>()
        return sut
    }
}
