//
//  ShuffleTheArray.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 20/07/2023.
//

import Foundation

class ShuffleTheArray {

    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
            // create array to return
        var result = [Int]()
            // loop and append an index and next index + n
        for index in 0..<n {
            result.append(nums[index])
            result.append(nums[index + n])
        }
            //return appended results
        return result
    }
}
