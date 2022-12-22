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
    
    // test log function
    func testLog(){
        // Given
        let message = "Test Log"
  
        //When
        
        // test veryHigh function
        logger.log(message, severity: .veryHigh)
        
        // test high function
        logger.log(message, severity: .high)
        
        // test moderate function
        logger.log(message, severity: .moderate)
        
        // test low function
        logger.log(message, severity: .low)
        
        // test veryLow function
        logger.log(message, severity: .veryLow)
        //Then
        
        XCTAssertNotNil(logger.logMessage)
        
    }
    func testEnvironment(){
            // Given
        let message = "Test Log"
        
        logger.configure(tag: message, environment: .staging)
        
        logger.log(message, severity: .veryLow)
        
        logger.configure(tag: message, environment: .production)
        
        logger.log(message, severity: .veryLow)
        
        XCTAssertNotNil(logger.logMessage)
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
