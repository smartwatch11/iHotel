//
//  MainCoordinator.swift
//  iHotel
//
//  Created by Egor Rybin on 20.12.2023.
//

import SwiftUI


enum Page: String, Identifiable {
    case hotel, rooms, booking, success_order
    
    var id: String {
        self.rawValue
    }
}


class MainCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View{
        switch page {
        case .hotel:
            HotelView().navigationBarBackButtonHidden(true)
        case .rooms:
            RoomsView().navigationBarBackButtonHidden(true)
        case .booking:
            BookingView().navigationBarBackButtonHidden(true)
        case .success_order:
            SuccessOrderView().navigationBarBackButtonHidden(true)
        }
    }
}
