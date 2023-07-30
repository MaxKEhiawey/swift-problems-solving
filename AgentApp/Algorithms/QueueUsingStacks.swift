//
//  QueueUsingStacks.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 22/07/2023.
//

import Foundation

class QueueUsingStacks {

    func findAnagrams(_ s: String, _ p: String) -> [Int] {

        let sChars = Array(s)
        let pChars = Array(p)
        var pCount = [Character: Int]()
        var sCount = [Character: Int]()
        var result = [Int]()

        for char in pChars {
            pCount[char, default: 0] += 1
        }

        let n = s.count
        let m = p.count

        if n < m {
            return result
        }

        for i in 0..<m {
            sCount[sChars[i], default: 0] += 1
        }

        if sCount == pCount {
            result.append(0)
        }

        for i in m..<n {
            sCount[sChars[i], default: 0] += 1
            sCount[sChars[i - m], default: 0] -= 1
            if sCount[sChars[i - m]] == 0 {
                sCount.removeValue(forKey: sChars[i - m])
            }
            if sCount == pCount {
                result.append(i - m + 1)
            }
        }

        return result
    }

}
