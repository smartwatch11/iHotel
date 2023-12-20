//
//  TotalPriceView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct TotalPriceView: View {
    var title: String
    var value: Int
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
            Spacer()
            Text("\(value) ₽")
                .font(.custom(title == "К оплате" ? "SFProDisplay-Semibold" : "SFProDisplay-Regular", size: 16))
                .foregroundColor(title == "К оплате" ? Color(red: 13/255, green: 114/255, blue: 255/255) : Color(.label))
            
        }
        .padding(.horizontal)
    }
}
