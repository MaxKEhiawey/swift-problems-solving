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
    
    func testSolveQuadraticEquation() {
            // Given
        let calculator = Calculator()

            // Test case 1: Two distinct real roots
        let roots1 = calculator.solveQuadraticEquation(a: 2, b: -7, c: 3)
        XCTAssertEqual(roots1.0, 3.0)
        XCTAssertEqual(roots1.1, 0.5)

            // Test case 2: One real root
        let roots2 = calculator.solveQuadraticEquation(a: 1, b: -6, c: 9)
        XCTAssertEqual(roots2.0, 3.0)
        XCTAssertNil(roots2.1)

            // Test case 3: No real roots
        let roots3 = calculator.solveQuadraticEquation(a: 2, b: 1, c: 3)
        XCTAssertNil(roots3.0)
        XCTAssertNil(roots3.1)
    }
}
