    //
    //  ContentView.swift
    //  TestExample1
    //
    //  Created by Maxwell Ehiawey on 21/11/2022.
    //

import SwiftUI
import Combine
struct ContentView: View {
    @State var alertMessage = ""
    @State var name = "Name"
    @State var ID = "ID"
    @State var Age = "Age"
    @State var School = "School"
    @State var showAlert = false
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Problem 1")
            
            CommonTextField(placeholder: $name, value: $viewModel.userName)
            CommonTextField(placeholder: $ID, value: $viewModel.userId)
            CommonTextField(placeholder: $Age, value: $viewModel.userAge)
            CommonTextField(placeholder: $School, value: $viewModel.userSchool)
            
            Button("Submit") {
                validateFields()
            }
        }
        .padding(8)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("Got it!")))
        }
        
        
    }
    func triggerAlert (_ message: Int){
        
        switch message{
            case 1:
                alertMessage = "All field must contain value."
            case 2:
                alertMessage = "ID and Age must be numbers."
            case 3:
                alertMessage = "Could not save."
            default:
                alertMessage = ""
        }
        showAlert = true
    }
    func validateFields(){
        do {
            try viewModel.validateFields()
        } catch ErrorEnum.emptyFieldError{
            // do something
            triggerAlert(1)
        } catch ErrorEnum.notNumberError{
            // do something
            triggerAlert(2)
        } catch ErrorEnum.failedSubmitError{
            // do something
            triggerAlert(3)
        } catch {
            print(error)
        }
    }
   
}
