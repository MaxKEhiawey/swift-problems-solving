//
//  AgentAppTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 11/07/2023.
//

import XCTest
@testable import AgentApp

class CalculatorTests: XCTestCase {

    func testSolveTwoEquations() {
            // Given
        let calculator = Calculator()
        let equation1: (Double, Double, Double) = (6, 1, 18)
        let equation2: (Double, Double, Double) = (4, 1, 14)

            // When
        let solution = calculator.solveTwoEquations(eqn1: equation1, eqn2: equation2)

            // Then
        XCTAssertEqual(solution.0, 2, "Expected x value to be 2")
        XCTAssertEqual(solution.1, 6, "Expected y value to be 6")
    }

    func testGetDet() {
            // Arrange
        let calculator = Calculator()
        let value1: Double = 5.0
        let value2: Double = 3.0
        let expectedDet: Double = 2.0

            // Act
        do {
            if let det = try calculator.getDet(value1: value1, value2: value2) {
                
                    // Assert
                XCTAssertEqual(det, expectedDet, accuracy: 0.001, "Incorrect determinant value")
            }
        } catch {
            XCTFail("Unexpected error: \(error)")
        }

        func testGetDet_DivisionByZero() {
                // Arrange
            let value1: Double = 5.0
            let value2: Double = 5.0

                // Act & Assert
            XCTAssertThrowsError(try calculator.getDet(value1: value1, value2: value2)) { error in
                XCTAssertEqual(error.localizedDescription, "Division by zero")
            }
        }
    }
}
