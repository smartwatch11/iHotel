//
//  UserGroupFieldsView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct UserGroupFieldsView<Content: View>: View {
    @State private var isOpen: Bool = false
    @ViewBuilder let content: () -> Content
    var ordinalUserLabel: String
    
    var body: some View {
        VStack{
            Button{
                withAnimation {
                    isOpen.toggle()
                }
            } label: {
                HStack {
                    Text(ordinalUserLabel)
                        .foregroundColor(.black)
                        .font(.custom("SFProDisplay-Medium", size: 22))
                    Spacer()
                    Image(systemName: isOpen ?  "chevron.up.square" : "chevron.down.square.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 32))
                }
            }
            
            if isOpen {
                content()
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

