//
//  PalindromeNumber.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 19/07/2023.
//

import Foundation

class  PalindromeNumber {

    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var number = x
        var reverse = 0
        while number != 0 {
            let remainder = number % 10
            reverse = reverse * 10 + remainder
            number /= 10
        }
        return x == reverse
    }
}
