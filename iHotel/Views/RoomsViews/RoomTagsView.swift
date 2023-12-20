//
//  RoomTagsView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct RoomTagsView: View {
    @StateObject var viewModel = RoomsViewModel()
    @State var index: Int?
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(viewModel.roomsModel?.rooms[index ?? 0].peculiarities ?? [], id: \.self) { platform in
                self.item(for: platform)
                    .padding([.horizontal, .top], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if platform == viewModel.roomsModel?.rooms[index ?? 0].peculiarities.last
                        {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if platform == viewModel.roomsModel?.rooms[index ?? 0].peculiarities.last {
                            height = 0 // last item
                        }
                        return result
                    })
                    .padding(.bottom, platform == viewModel.roomsModel?.rooms[index ?? 0].peculiarities.last ? 30 : 4)
            }
        }
    }
    
    func item(for text: String) -> some View {
        Text(text)
            .background(Color(red: 251/255, green: 251/255, blue: 252/255))
            .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
            .font(.custom("SFProDisplay-Medium", size: 16))
            .cornerRadius(5)
    }
}

#Preview {
    RoomTagsView()
}
