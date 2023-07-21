//
//  ValidParenthesesTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 21/07/2023.
//

import XCTest
@testable import AgentApp

final class ValidParenthesesTests: XCTestCase {

    func testIsValid_ValidParentheses_ReturnsTrue() {
            // Arrange
        let validParentheses = ValidParentheses()
        let input = "{[()]}"

            // Act
        let result = validParentheses.isValid(input)

            // Assert
        XCTAssertTrue(result)
    }

}
