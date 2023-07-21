//
//  ShuffleArrayTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 21/07/2023.
//

import XCTest
@testable import AgentApp


final class ShuffleArrayTests: XCTestCase {

    func testShuffle() {
            // Arrange
        let shuffleTheArray = ShuffleTheArray()
        let inputArray = [1, 2, 3, 4, 5, 6]
        let n = inputArray.count / 2

            // Act
        let shuffledArray = shuffleTheArray.shuffle(inputArray, n)

            // Assert
        XCTAssertEqual(shuffledArray, [1, 4, 2, 5, 3, 6], "Shuffled array should match the expected output")
    }
}
