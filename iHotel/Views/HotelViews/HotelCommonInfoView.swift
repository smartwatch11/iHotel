//
//  CommonHotelInfo.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct HotelCommonInfoView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
    }
    
    @StateObject var viewModel = HotelViewModel()
    
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(
            topLeading: 0.0,
            bottomLeading: 12.0,
            bottomTrailing: 12.0,
            topTrailing: 0.0),
                               style: .continuous)
        .foregroundColor(Color(.systemBackground))
        .frame(height: 500)
        .overlay(alignment: .top) {
            VStack{
                VStack(alignment: .leading, spacing: 10) {
                    TabView {
                        ForEach(viewModel.hotelModel?.image_urls ?? [], id: \.self) {imageUrl in
                            
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
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(red: 255/255, green: 199/255, blue: 0))
                        .opacity(0.2)
                        .frame(width: 149, height: 29)
                        .overlay {
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(red: 1, green: 168/255, blue: 0))
                                    .font(.custom("SFProDisplay-Medium", size: 15))
                                Text("\(viewModel.hotelModel?.rating ?? 0) \(viewModel.hotelModel?.rating_name ?? "")")
                                    .font(.custom("SFProDisplay-Medium", size: 16))
                                    .foregroundColor(Color(red: 1, green: 168/255, blue: 0))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Spacer()
                }
                
                Text("\(viewModel.hotelModel?.name ?? "")")
                    .font(.custom("SFProDisplay-Medium", size: 22))
                    .padding(.leading, -20)
                    .padding(.top, 5)
                
                Button {
                    print("disabled btn")
                } label: {
                    Text("\(viewModel.hotelModel?.adress ?? "")")
                        .font(.custom("SFProDisplay-Medium", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.top, 5)
                }
                
                HStack {
                    Text("от \(viewModel.hotelModel?.minimal_price ?? 0 ) ₽")
                        .font(.custom("SFProDisplay-Semibold", size: 30))
                        .padding(.leading)
                    Text("\(viewModel.hotelModel?.price_for_it ?? "")")
                        .font(.custom("SFProDisplay-Regular", size: 16))
                        .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                        .padding(.top, 16)
                    Spacer()
                }
                .padding(.top)
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}
#Preview {
    HotelCommonInfoView()
}
