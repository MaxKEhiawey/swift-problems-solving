//
//  ContainsDuplicate .swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 20/07/2023.
//

import Foundation

class ContainsDuplicate {

    func containsDuplicate(_ nums: [Int]) -> Bool {
        let arr = nums
        var numSet = Set<Int>()
        for number in arr {
            if numSet.contains(number) {
                return true
            }
            numSet.insert(number)
        }
        return false
    }
}
