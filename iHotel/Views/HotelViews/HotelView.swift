//
//  HotelView.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI

struct HotelView: View {

    @EnvironmentObject private var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HotelCommonInfoView()
                    HotelMoreInfoView()
                    
                    
                    VStack {
                        Divider()
                        Button {
                            coordinator.push(.rooms)
                        } label: {
                            Text("К выбору номера")
                                .foregroundColor(.white)
                                .font(.custom("SFProDisplay-Medium", size: 16))
                        }
                        .frame(height: 48)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 13/255, green: 114/255, blue: 255/255))
                        .cornerRadius(15)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .background(Color(red: 1, green: 1, blue: 1))
                }
                .background(Color(red: 244/255, green: 244/255, blue: 247/255))
                .edgesIgnoringSafeArea(.top)
            }
            .navigationTitle("Отель").font(.custom("SFProDisplay-Medium", size: 18))
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}


#Preview {
    HotelView()
}
