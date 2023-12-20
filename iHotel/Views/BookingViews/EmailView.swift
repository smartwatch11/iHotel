//
//  EmailView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct EmailView: View {
    
    @Binding var email: String
    @Binding var isEmailValid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("Почта")
                .font(.caption)
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
            
            TextField("\("exampleemail.000@mail.ru")", text: $email, onCommit: {
                if !isValid(email){
                    isEmailValid = false
                } else {
                    isEmailValid = true
                }
            })
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .onChange(of: email) { oldValue, newValue in
                isEmailValid = true
            }
            
        }
        .padding()
        .background(isEmailValid ? Color(red: 246/255, green: 246/255, blue: 249/255) : Color(red: 235/255, green: 87/255, blue: 87/255))
        .opacity(isEmailValid ? 1 : 0.15)
        .cornerRadius(10)
    }
    
    private func isValid(_ data: String) -> Bool{
        let dataRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let dataPred = NSPredicate(format:"SELF MATCHES %@", dataRegEx)
        return dataPred.evaluate(with: data)
    }
}

