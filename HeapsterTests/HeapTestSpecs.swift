//
//  HeapTestSpecs.swift
//  HeapsterTests
//
//  Created by Yevhen Dubinin on 2/18/24.
//

import Foundation

protocol HeapTestSpecs {
    func test_init_heapCountEqualsZeroOnInit()

    func test_build_emptyWhenBuiltWithEmptyArray()
    func test_build_hasCountOfElements()

    func test_isEmpty_returnsEmptyOnInit()
    func test_isEmpty_returnsEmptyOnBuildWithNoElements()
    func test_isEmpty_returnsNotEmptyOnBuildWithSingleElement()
    func test_isEmpty_returnsNotEmptyOnBuildWithMultipleElements()
    func test_isEmpty_returnsNotEmptyOnInsertSingleElement()
    func test_isEmpty_returnsNotEmptyOnInsertMultipleElements()

    func test_peek_returnsNilOnInitHeap()
    func test_peek_returnsNilOnBuildWithNoElements()
    func test_peek_returnsNilOnBuildWithSingleElement() throws
    func test_peek_hasNoSideEffectsOnBuildWithSingleElement() throws
    func test_peek_hasNoSideEffectsOnBuildWithMultipleElements() throws
    func test_peek_hasNoSideEffectsOnBuildWithSameElements() throws

    func test_insert_increasesCountOnSingleElementInsert()
    func test_insert_increasesCountOnMultipleElementsInsert()
    func test_insert_increasesCountOnSameElementInsert()
    func test_insert_increasesCountAfterBuildWithMultipleElements()
    func test_insert_increasesCountAfterBuildAndInsertingExistingElement()
}

protocol MinHeapTestSpecs: HeapTestSpecs {
    func test_peek_returnsMinValueOnBuildWithMultipleElements() throws
    func test_peek_returnsMinValueOnBuildSameElements() throws

    func test_extractMin_returnsNilOnInit()

    func test_extractMin_returnsNilOnBuildWithNoElements()
    func test_extractMin_returnsEmptyCountOnBuildWithSingleElement()
    func test_extractMin_decreasesCountOnBuildWithMultipleElements()
    func test_extractMin_returnsMinValueOnBuildWithSingleElement() throws
    func test_extractMin_returnsMinValueOnBuildWithMultipleElements() throws

    func test_extractMin_returnsNilAfterExtractingAllValues() throws

    func test_extractMin_returnsMinValueAfterMinElementInsert() throws
    func test_extractMin_returnsMinValueAfterNextToMinElementInsert() throws
    func test_extractMin_returnsMinValueAfterMultiElementsInsert() throws
}
