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
            AppLoggerClass.shared.detailedLogs("Logging example")
        }
    }
}
