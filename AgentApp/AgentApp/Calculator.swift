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

    func solveQuadraticEquation(a: Double, b: Double, c: Double) -> (Double?, Double?) {

        /** for ax^2 + bx + c = 0;
         x = -b (+-) √(b^2 - 4ac)/2a

         if b^2 - 4ac > 0, then √(b^2 - 4ac) is a real number, and the quadratic equation has real two solutions(roots); eg x^2 - 6x - 9 = 0; => b^2 - 4ac = 72; > 0

         if b^2 - 4ac = 0, then √(b^2 - 4ac) is also 0, and the quadratic equation becomes -b/2a, which means the quaadratic equation has one real solution(root); eg. x^2 - 6x + 9 = 0; => b^2 - 4ac  = 0;

         if b^2 - 4ac < 0, then √(b^2 - 4ac) is imaginary number, which means the quadratic equation has no real solutions(roots); eg. 2x^2 - 6x + 9 = 0; => b^2 - 4ac  = -36;  < 0
         **/
        let discriminant = b * b - 4 * a * c

        if discriminant > 0 {
            let root1 = (-b + sqrt(discriminant)) / (2 * a)
            let root2 = (-b - sqrt(discriminant)) / (2 * a)
            return (root1, root2)
        } else if discriminant == 0 {
            let root = -b / (2 * a)
            return (root, nil)
        } else {
            return (nil, nil)
        }
    }

}
