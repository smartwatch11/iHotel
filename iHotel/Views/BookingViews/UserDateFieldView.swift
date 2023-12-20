//
//  UserDateFieldView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct UserDateFieldView: View {
    var date: String
    @Binding var modelDateField: Date?
    @Binding var isWrong: Bool
    @State private var isEdit: Bool = false
    
    var body: some View {
        VStack {
            if isEdit || modelDateField != nil {
                HStack {
                    Text(date)
                        .font(.caption)
                        .foregroundColor(Color(red: 169/255, green: 171/255, blue: 183/255))
                    Spacer()
                }
            }
            
            UserDatePickerForTextFieldView(placeholder: date, date: $modelDateField)
            
        }
        .padding()
        .background(isWrong && modelDateField == nil ? Color(red: 235/255, green: 87/255, blue: 87/255) : Color(red: 246/255, green: 246/255, blue: 249/255))
        .opacity(isWrong && modelDateField == nil ? 0.15 : 1)
        .cornerRadius(10)
    }
}
