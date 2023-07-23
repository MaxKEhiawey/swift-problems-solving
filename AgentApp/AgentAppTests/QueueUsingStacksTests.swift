//
//  QueueUsingStacksTests.swift
//  AgentAppTests
//
//  Created by AMALITECH MACBOOK on 22/07/2023.
//

import XCTest
@testable import AgentApp

final class QueueUsingStacksTests: XCTestCase {

    func testFindAnagrams() {
        let anagramFinder = QueueUsingStacks()

            // Test case 1: Anagrams exist
        let s1 = "cbaebabacd"
        let p1 = "abc"
        let result1 = anagramFinder.findAnagrams(s1, p1)
        XCTAssertEqual(result1, [0, 6], "Failed for test case 1")

            // Test case 2: Anagrams do not exist
        let s2 = "abcd"
        let p2 = "xyz"
        let result2 = anagramFinder.findAnagrams(s2, p2)
        XCTAssertEqual(result2, [], "Failed for test case 2")

            // Test case 3: Anagrams with repeating characters
        let s3 = "abcaabca"
        let p3 = "abc"
        let result3 = anagramFinder.findAnagrams(s3, p3)
        XCTAssertEqual(result3, [0, 1, 4, 5], "Failed for test case 3")
    }

}
