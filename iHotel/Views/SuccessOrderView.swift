//
//  ContentView.swift
//  iHotel
//
//  Created by Egor Rybin on 20.12.2023.
//

import SwiftUI

struct SuccessOrderView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Circle()
                        .foregroundColor(Color(red: 246/255, green: 246/255, blue: 249/255))
                        .frame(width: 94)
                        .overlay {
                            Text("🎉")
                                .font((.system(size: 44)))
                        }
                    
                    Text("Ваш заказ принят в работу")
                        .font(.custom("SFProDisplay-Medium", size: 22))
                    
                    Text("Подтверждение заказа №\(String(randomOrderNumber())) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                        .multilineTextAlignment(.center)
                        .font(.custom("SFProDisplay-Regular", size: 16))
                        .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                        .padding(10)
                }
                .padding()
                .navigationTitle("Заказ оплачен")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {coordinator.pop()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }))

                VStack {
                    Spacer()
                    Divider()
                    Button {
                        coordinator.popToRoot()
                    } label: {
                        Text("Супер!")
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
            }
        }
    }
}

func randomOrderNumber() -> Int {
    return Int.random(in: 100000...999999)
}

#Preview {
    SuccessOrderView()
}
