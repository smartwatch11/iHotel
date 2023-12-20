//
//  BookingMainDataView.swift
//  iHotel
//
//  Created by Egor Rybin on 25.12.2023.
//

import SwiftUI

struct BookingMainDataView: View {
    
    var title: String
    var data: String
    
    private let columns: [GridItem] = [GridItem(.fixed(150), alignment: .topLeading),GridItem(.flexible(), alignment: .topLeading)]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            Text(title)
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
            Text(data)
        }
        .padding(.horizontal)
    }
}

#Preview {
    BookingMainDataView(title: "title", data: "data")
}
