//
//  ViewModel.swift
//  TestExample1
//
//  Created by Maxwell Ehiawey on 21/11/2022.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var userId = ""
    @Published var userAge = ""
    @Published var userSchool = ""
    @Published var numberOfSaves = 0
    
    func validateFields() throws{
        numberOfSaves += 1
        if numberOfSaves == 3 {
            numberOfSaves = 0
            throw ErrorEnum.failedSubmitError
        }
        if userName.isEmpty || userId.isEmpty || userAge.isEmpty || userSchool.isEmpty {
          throw  ErrorEnum.emptyFieldError
        } else if !userId.isNumber || !userAge.isNumber{
          throw ErrorEnum.notNumberError
      }
       
    }
}
