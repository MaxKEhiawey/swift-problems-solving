//
//  AppLoggerClass .swift
//  second-problem-solution
//
//  Created by Maxwell Ehiawey on 29/11/2022.
//

import Foundation
import os

final class AppLoggerClass: ObservableObject {
    static let shared = AppLoggerClass()
    init(){}
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: "second-problem-solution"
    )
    func detailedLogs(
        _ logDescription: String,
        logFile: String = #file,
        loggingLine: Int = #line,
        loggingfunction: String = #function,
        isLocalDetailedLogs: Bool = false,
        isRemoteLogs: Bool = false
    ){
        let loggingFile = (logFile as NSString).lastPathComponent
        if isLocalDetailedLogs {
            print(logDescription)
        } else {
            print("Description📲\(logDescription),\nfile📄\(loggingFile), \nfunction🤖\(loggingfunction),\nline🎯\(loggingLine)")
        }
    }
}
