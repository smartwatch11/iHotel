//
//  MainCoordinatorView.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI

struct MainCoordinatorView: View {
    
    @StateObject private var coordinator = MainCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .hotel)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    MainCoordinatorView()
}
