//
//  CommonTextfield.swift
//  TestExample1
//
//  Created by Maxwell Ehiawey on 22/11/2022.
//

import SwiftUI


struct CommonTextField: View {
    @Binding var placeholder: String
    @Binding var value: String
    var body: some View {
        TextField(placeholder, text: $value)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}

