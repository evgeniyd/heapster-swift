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
        let sut = MinHeap<Int>()
        XCTAssertEqual(sut.count, 0)
    }
}
