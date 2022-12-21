//
//  UserDefault.swift
//  second-problem-solution
//
//  Created by Maxwell Ehiawey on 10/12/2022.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func setValue(value: Any, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    func value(forKey key: String) -> Any? {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: key)
    }
}

