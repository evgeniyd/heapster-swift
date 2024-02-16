//
//  MinHeapTests.swift
//  LCDTTests
//
//  Created by Yevhen Dubinin on 2/16/24.
//

import XCTest
import LCDT

class MinHeapTests: XCTestCase {

    func test_init_heapIsEmptyOnInit() {
        let sut = makeSUT()
        XCTAssertEqual(sut.count, 0)
    }

    func test_build_emptyWhenBuiltWithEmptyArray() {
        var sut = makeSUT()

        sut.build(from: [])

        XCTAssertEqual(sut.count, 0)
    }

    func test_build_hasCountOfNumberOfElements() {
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

    // MARK: Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MinHeap<Int> {
        let sut = MinHeap<Int>()
        return sut
    }
}
