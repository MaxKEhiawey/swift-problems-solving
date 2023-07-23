//
//  ContainsDuplicateTest.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 21/07/2023.
//

import XCTest
@testable import AgentApp

final class ContainsDuplicateTest: XCTestCase {

    func testContainsDuplicate() {
            // Arrange
        let containsDuplicate = ContainsDuplicate()

            // Act
        let hasDuplicate1 = containsDuplicate.containsDuplicate([1, 2, 3, 4, 5, 6])
        let hasDuplicate2 = containsDuplicate.containsDuplicate([3, 5, 6, 3, 2, 1])
        let hasDuplicate3 = containsDuplicate.containsDuplicate([])
        let hasDuplicate4 = containsDuplicate.containsDuplicate([1, 1, 1, 1])

            // Assert
        XCTAssertFalse(hasDuplicate1, "Array has no duplicates, expected false.")
        XCTAssertTrue(hasDuplicate2, "Array has duplicates, expected true.")
        XCTAssertFalse(hasDuplicate3, "Empty array has no duplicates, expected false.")
        XCTAssertTrue(hasDuplicate4, "Array has duplicates, expected true.")
    }

}
