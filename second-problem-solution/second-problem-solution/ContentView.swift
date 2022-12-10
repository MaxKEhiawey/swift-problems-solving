    //
    //  ContentView.swift
    //  second-problem-solution
    //
    //  Created by Maxwell Ehiawey on 29/11/2022.
    //

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .padding()
        .onAppear(){
            userDefaults.setValue(value: "Maxwell:1038443", forKey: "userID")
            
            Logger.shared.configure(tag: "dedugging-logs", environment: .debugging)
            
            Logger.shared.log("newly created logs", severity: .veryHigh)
            
        }
    }
}
