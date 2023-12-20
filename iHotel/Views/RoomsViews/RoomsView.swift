//
//  RoomsView.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI

struct RoomsView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    @StateObject var viewModel = RoomsViewModel()
    
    @StateObject var hotelViewModel = HotelViewModel()
    
    private var columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.roomsModel?.rooms ?? [], id: \.self)
                {room in
                    VStack{
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color(.systemBackground))
                            .frame(height: 539)
                            .overlay(alignment: .top) {
                                VStack {
                                    VStack(alignment: .leading, spacing: 10) {
                                        TabView {
                                            ForEach(room.image_urls, id: \.self) {imageUrl in
                                                
                                                if let image = viewModel.images.first(where: { $0.url == imageUrl })?.image {
                                                    Image(uiImage: image)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(height: 257)
                                                }
                                                else {ProgressView()}
                                                
                                            }
                                        }
                                        .tabViewStyle(PageTabViewStyle())
                                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                                        .background(Color.gray)
                                        .frame(height: 257)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    }
                                    
                                    HStack {
                                        Text("\(room.name)")
                                            .font(.custom("SFProDisplay-Medium", size: 22))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    VStack {
                                        RoomTagsView(index: room.id - 1)
                                            .padding(.leading)
                                        
                                        
                                        HStack {
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(width: 192, height: 29)
                                                .foregroundColor(Color(red: 13/255, green: 114/255, blue: 255/255))
                                                .opacity(0.1)
                                                .overlay {
                                                    Button {
                                                        print("disable btn")
                                                    } label: {
                                                        HStack {
                                                            Text("Подробнее о номере")
                                                                .foregroundColor(Color(red: 13/255, green: 114/255, blue: 255/255))
                                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                                            Image(systemName: "chevron.right")
                                                                .foregroundColor(Color(red: 13/255, green: 114/255, blue: 255/255))
                                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                                        }
                                                    }
                                                }
                                                .padding(.leading)
                                            Spacer()
                                        }
                                    }
                                    
                                    HStack {
                                        Text("\(room.price) ₽")
                                            .font(.custom("SFProDisplay-Semibold", size: 30))
                                            .padding(.leading)
                                        Text("\(room.price_per)")
                                            .font(.custom("SFProDisplay-Regular", size: 16))
                                            .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                                            .padding(.top, 7)
                                        Spacer()
                                    }
                                    
                                    
                                    VStack {
                                        Spacer()
                                        Button {
                                            coordinator.push(.booking)
                                        } label: {
                                            Text("К выбору номера")
                                                .foregroundColor(.white)
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        .frame(height: 48)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(red: 13/255, green: 114/255, blue: 255/255))
                                        .cornerRadius(15)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    }
                                    Spacer()
                                }
                            }
                    }
                    
                }
                .background(Color(red: 244/255, green: 244/255, blue: 247/255))
                .edgesIgnoringSafeArea(.all)
            }
            .navigationTitle("\(hotelViewModel.hotelModel?.name ?? "")")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {coordinator.pop()}, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }))
        }
        .onAppear {
            viewModel.fetchData()
            hotelViewModel.fetchData()
        }
    }
}


#Preview {
    RoomsView()
}
