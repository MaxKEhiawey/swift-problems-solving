    //
    //  LoggerClassApp.swift
    //  second-problem-solution
    //
    //  Created by Maxwell Ehiawey on 05/12/2022.
    //

import Foundation

public class Logger {
    
    static let shared = Logger(environment: .debugging)
    
    var environment: Environment = .debugging
    
    var logMessage = ""
    
    var dateFormat: String
    
    var userID: String
    
    var session: String
    
    var tags: [String]
    
    init(environment: Environment, dateFormat: String = "yyyy-MM-dd HH:mm:ss"){
        
        self.environment = environment
        
        self.dateFormat = dateFormat
        
        self.userID = ""
        
        self.session = ""
        
        self.tags = []
    }
    
    func log(_ message: String, severity: Severity = .veryLow) {
        
        logMessage = "[\(userID)] :[\(severity)]:[\(message)]"
        
        if !session.isEmpty {
            logMessage += " [\(session)]"
        }
        
        if !tags.isEmpty {
            logMessage += " [\(tags.joined(separator: ","))]"
        }
        
        switch environment {
                
            case .debugging:
                debugPrint(logMessage)
                break
            case .production:
            // TODO:  log this to file instead of printing
            writeLogToFile(logMessage, fileName: "\(userID)-logMessages.txt")
                break
            case .staging:
                print(logMessage )
                break
        }
    }

    func dateToLog()->String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = dateFormat
        
        let date = formatter.string(from: Date.now)
        
        return date
    }
    
    func configure(tag: String, environment: Environment){
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = dateFormat
        
        self.session = formatter.string(from: Date.now)
        
        getUserID()
        
        setSession()
        
        setEnvironment(environment: environment)
        
        addTag(tag: tag)
    }
    
    func getUserID(){
        
        self.userID =  "Max"
    }
    
    func setEnvironment(environment: Environment) {
        
        self.environment = environment
    }
    
    func setSession() {
        
        self.session = dateToLog()
    }
    
    func addTag(tag: String) {
        
        self.tags.append(tag)
    }
    
        // MARK: File Management to write to file
    func writeLogToFile(_ log: String, fileName: String) {
        
        let fileManager = FileManager.default
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        do {
            try log.write(to: fileURL, atomically: true, encoding: .utf8)
            
        } catch {
            
            print("Error writing log to file: \(error.localizedDescription)")
        }
    }
    
        // MARK: File Management to read to file
    func readFromFile(fileName: String) -> String? {
        
        let fileManager = FileManager.default
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        if fileManager.fileExists(atPath: fileURL.path) {
            
            if let fileContents = fileManager.contents(atPath: fileURL.path) {
                
                return String(data: fileContents, encoding: .utf8)
            }
            else {
                print("Error reading contents of file at URL: \(fileURL)")
                
                return nil
            }
        } else {
            print("File does not exist at URL: \(fileURL)")
            
            return nil
        }
    }
    
        // MARK: Firebase
//    private func pushLogToFirebase(logString: String) {
            // Use Firebase SDK to authenticate with Firebase and upload the log string to a designated storage location
//    }
    enum Environment {
        case debugging
        case staging
        case production
    }
}

enum Severity {
    case veryHigh
    case high
    case moderate
    case low
    case veryLow
}
