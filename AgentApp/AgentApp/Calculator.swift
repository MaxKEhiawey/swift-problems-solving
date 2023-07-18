//
//  Calculator.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 11/07/2023.
//

import Foundation


class Calculator {
    func solveTwoEquations(eqn1: (Double, Double, Double), eqn2:( Double, Double, Double)) -> (Double, Double) {

        let eqnOne = (x: eqn1.0, y: eqn1.1, constant: eqn1.2 )

        let eqnTwo = (x: eqn2.0, y: eqn2.1, constant: eqn2.2 )

        var xyValues: (Double, Double) = (0.0, 0.0)

        let detValue1 = eqnOne.x*eqnTwo.y
        let detValue2 = eqnTwo.x*eqnOne.y


        do {
            if let det = try getDet(value1: detValue1, value2: detValue2) {
                print("inverse", det)

                xyValues.0 = ((eqnOne.constant*eqnTwo.y)+(eqnTwo.constant*(-eqnOne.y)))/det
                xyValues.1 = ((eqnOne.constant*(-eqnTwo.x))+(eqnTwo.constant*eqnOne.x))/det
            }

        } catch(let error) {

            print(error)
        }
        return xyValues
    }

    func getDet(value1: Double, value2: Double) throws -> Double? {
        guard (value1 - value2) != 0.0 else {
            throw NSError(domain: "Division by zero", code: 0, userInfo: nil)
        }
        return (value1 - value2)
    }
}
