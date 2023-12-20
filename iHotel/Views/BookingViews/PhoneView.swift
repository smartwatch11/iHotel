//
//  PhoneView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct PhoneView: View {
    
    @State var phone: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("Номер телефона")
                .font(.caption)
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
            TextField("+7(\\*\\*\\*) \\*\\*\\*-\\*\\*-\\*\\*", text: $phone)
                .keyboardType(.phonePad)
                .onChange(of: phone) { oldValue, newValue in
                    if newValue.count == 1 && newValue != "+" {
                        phone = "+7(" + phone
                    } else if newValue.count == 6 {
                        phone.insert(")", at: phone.index(phone.startIndex, offsetBy: 6))
                        phone.insert(" ", at: phone.index(phone.startIndex, offsetBy: 7))
                    } else if newValue.count == 11 {
                        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: 11))
                    } else if newValue.count == 14 {
                        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: 14))
                    } else if newValue.count == 18 {
                        phone.removeLast()
                    }
                }
        }
        .padding()
        .background(Color(red: 246/255, green: 246/255, blue: 249/255))
        .cornerRadius(10)
    }
}

#Preview {
    PhoneView(phone: "+7(999) 000-11-22")
}
