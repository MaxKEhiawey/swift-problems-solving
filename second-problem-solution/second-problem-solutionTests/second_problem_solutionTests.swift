//
//  second_problem_solutionTests.swift
//  second-problem-solutionTests
//
//  Created by Maxwell Ehiawey on 29/11/2022.
//

import XCTest
@testable import second_problem_solution

final class second_problem_solutionTests: XCTestCase {

    let logger = Logger(environment: .debugging)
    
    // test veryHigh function
    func testVeryHigh(){
        // Given
        let message = "Test Log"
        
        let severity: Severity = .veryHigh
        
        // When
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
        // Then
        logger.veryHigh(message)
        XCTAssertEqual(logger.logMessage, assertion)
    }
    
    // test high function
    func testHigh(){
            // Given
        let message = "Test Log"
        
        let severity: Severity = .high
        
            // When
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
            // Then
        logger.high(message)
        
        XCTAssertEqual(logger.logMessage, assertion)
    }
    
    // test moderate function
    func testModerate(){
            // Given
        let message = "Test Log"
        
        let severity: Severity = .moderate
        
            // When
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
            // Then
        logger.moderate(message)
        
        XCTAssertEqual(logger.logMessage, assertion)
    }
    
    // test low function
    func testLow(){
            // Given
        let message = "Test Log"
        
        let severity: Severity = .low
        
            // When
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
            // Then
        logger.low(message)
        
        XCTAssertEqual(logger.logMessage, assertion)
    }
    
    // test veryLow function
    func testveryLow(){
            // Given
        let message = "Test Log"
        
        let severity: Severity = .veryLow
        
            // When
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
            // Then
        logger.veryLow(message)
        
        XCTAssertEqual(logger.logMessage, assertion)
    }
    
    // test log function
    func testLog(){
        // Given
        let message = "Test Log"
        
        let severity: Severity = .low
        
        //When
        
        var assertion = "[\(logger.userID)] :[\(severity)]:[\(message)]"
        
        if !logger.session.isEmpty {
            
            assertion += " [\(logger.session)]"
        }
        
        if !logger.tags.isEmpty {
            
            assertion += " [\(logger.tags.joined(separator: ","))]"
        }
        
        logger.log(message, severity: severity)
        //Then
        
        XCTAssertEqual(logger.logMessage, assertion)
        
    }
    
    // test writeToFile
    func testWriteLogToFile() {
            // Create a test log string
        let log = "This is a test log"
        
            // Set the file name for the test
        let fileName = "testLog.txt"
        
            // Call the writeLogToFile function with the test log and file name
        logger.writeLogToFile(log, fileName: fileName)
        
            // Get the file manager and documents directory URL
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
            // Append the file name to the documents directory URL to get the file URL
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
            // Assert that the file exists at the file URL
        XCTAssertTrue(fileManager.fileExists(atPath: fileURL.path))
        
            // Read the contents of the file at the file URL
        var fileContents: String = ""
        do {
            fileContents = try String(contentsOf: fileURL)
        } catch {
            XCTFail("Error reading contents of file: \(error.localizedDescription)")
        }
        
            // Assert that the file contents match the test log
        XCTAssertEqual(fileContents, log)
    }
    
    // test readFromFile
    func testReadFromFile() {
            // Set the file name for the test
        let fileName = "testFile.txt"
        
            // Create a test string to write to the file
        let testString = "This is a test string"
        
            // Write the test string to the file
        logger.writeLogToFile(testString, fileName: fileName)
        
            // Call the readFromFile function with the file name
        let result = logger.readFromFile(fileName: fileName)
        
            // Assert that the result is not nil
        XCTAssertNotNil(result)
        
            // Assert that the result matches the test string
        XCTAssertEqual(result, testString)
    }


}
