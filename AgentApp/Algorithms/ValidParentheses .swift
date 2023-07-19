//
//  ValidParentheses .swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 19/07/2023.
//

import Foundation

class ValidParentheses {
    
    func isValid(_ s: String) -> Bool {
        var par = [Character]()
        let chars = s
        for c in chars {
            switch c {
                case "(", "[", "{":
                    par.append(c)

                case ")":
                    if "(" == par.last {
                        par.removeLast()
                    } else {
                        return false
                    }
                case "}":
                    if "{" == par.last {
                        par.removeLast()
                    } else {
                        return false
                    }
                case "]":
                    if "[" == par.last {
                        par.removeLast()
                    } else {
                        return false
                    }

                default: break
            }
        }

        return par.isEmpty
    }
}

