//
//  PalidromeNumberTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 22/07/2023.
//

import XCTest
@testable import AgentApp

final class PalidromeNumberTests: XCTestCase {

    func testPositivePalindrome() {
        let palindrome = PalindromeNumber()
        XCTAssertTrue(palindrome.isPalindrome(121))
    }

    func testNegativeNumber() {
        let palindrome = PalindromeNumber()
        XCTAssertFalse(palindrome.isPalindrome(-121))
    }

    func testNonPalindrome() {
        let palindrome = PalindromeNumber()
        XCTAssertFalse(palindrome.isPalindrome(12345))
    }

    func testZeroIsPalindrome() {
        let palindrome = PalindromeNumber()
        XCTAssertTrue(palindrome.isPalindrome(0))
    }

    func testSingleDigitIsPalindrome() {
        let palindrome = PalindromeNumber()
        XCTAssertTrue(palindrome.isPalindrome(9))
    }

}
