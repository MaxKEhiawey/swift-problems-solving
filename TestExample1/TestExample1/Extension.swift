//
//  Extension.swift
//  TestExample1
//
//  Created by Maxwell Ehiawey on 22/11/2022.
//

import Foundation

extension String {
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", // 1
            options: .regularExpression) != nil
    }
}
