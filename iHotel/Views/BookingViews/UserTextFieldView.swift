//
//  UserTextFieldView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct UserTextFieldView: View {
    var text: String
    @Binding var modelTextField: String
    @Binding var isWrong: Bool
    @State private var isEdit: Bool = false
    
    var body: some View {
        VStack {
            if isEdit || !modelTextField.isEmpty {
                HStack {
                    Text(text)
                        .font(.caption)
                        .foregroundColor(Color(red: 169/255, green: 171/255, blue: 183/255))
                    Spacer()
                }
            }
            
            TextField(text, text: $modelTextField, onEditingChanged: { edit in
                isEdit = edit
                isWrong = false
            },
            onCommit: {
                print("save data")
            })
            .keyboardType(.default)
            .autocapitalization(.none)
            .disableAutocorrection(true)
        }
        .padding()
        .background(isWrong && modelTextField.isEmpty ? Color(red: 235/255, green: 87/255, blue: 87/255) : Color(red: 246/255, green: 246/255, blue: 249/255))
        .opacity(isWrong && modelTextField.isEmpty ? 0.15 : 1)
        .cornerRadius(10)
    }

}

