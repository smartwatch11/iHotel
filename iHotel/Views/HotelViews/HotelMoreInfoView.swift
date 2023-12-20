//
//  MoreHotelInfo.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct HotelMoreInfoView: View {
    @StateObject var viewModel = HotelViewModel()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(Color(.systemBackground))
            .frame(height: 450)
            .overlay(alignment: .top) {
                VStack {
                    HStack {
                        Text("Об отеле")
                            .padding(.leading)
                            .padding(.top)
                            .font(.custom("SFProDisplay-Medium", size: 22))
                        Spacer()
                    }
                    
                    HotelTagsView()
                        .padding(.leading)
                    
                    
                    Text(viewModel.hotelModel?.about_the_hotel.description ?? "")
                        .font(.custom("SFProDisplay-Regular", size: 16))
                        .padding(.horizontal)
                        //.padding(.top)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 184)
                        .padding()
                        .foregroundColor(Color(red: 251/255, green: 251/255, blue: 252/255))
                        .overlay {
                            VStack(spacing: 10) {
                                Button {
                                    print("disabled btn")
                                } label: {
                                    HStack {
                                        Image("happyFaceSquare")
                                            .frame(width: 24, height: 24)
                                        VStack(alignment: .leading) {
                                            Text("Удобства")
                                                .foregroundColor(Color(red: 44/255, green: 48/255, blue: 53/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                            Text("Самое необходимое")
                                                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 30)
                                }
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 1)
                                    .padding(.leading, 65)
                                    .padding(.trailing, 30)
                                    .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                    .opacity(0.15)
                                
                                Button {
                                    print("disabled btn")
                                } label: {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.black)
                                            .font(.custom("SFProDisplay-Medium", size: 24))
                                        VStack(alignment: .leading) {
                                            Text("Что включено")
                                                .foregroundColor(Color(red: 44/255, green: 48/255, blue: 53/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                            Text("Самое необходимое")
                                                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 30) }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 1)
                                    .padding(.leading, 65)
                                    .padding(.trailing, 30)
                                    .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                    .opacity(0.15)
                                Button {
                                    print("disabled btn")
                                } label: {
                                    HStack {
                                        Image(systemName: "xmark.square")
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.black)
                                            .font(.custom("SFProDisplay-Medium", size: 24))
                                        VStack(alignment: .leading) {
                                            Text("Что не включено")
                                                .foregroundColor(Color(red: 44/255, green: 48/255, blue: 53/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                            Text("Самое необходимое")
                                                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 30) }
                            }
                        }
                }
                .onAppear {
                    viewModel.fetchData()
                }
            }
    }
}

#Preview {
    HotelMoreInfoView()
}
