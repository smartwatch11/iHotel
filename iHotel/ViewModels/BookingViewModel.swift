//
//  BookingViewModel.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI
import Combine

class User: ObservableObject {
    
    @Published var userName: String = ""
    @Published var userSurname: String = ""
    @Published var dateOfBirth: Date?
    @Published var citizenship: String = ""
    @Published var passportID: String = ""
    @Published var validityPeriod: Date?
    
    var isFieldsEmpty: Bool {
        return userName.isEmpty || userSurname.isEmpty || dateOfBirth == nil || citizenship.isEmpty || passportID.isEmpty || validityPeriod == nil
    }
}

class BookingViewModel: ObservableObject {
    @Published var bookingModel: BookingModel?
    @Published var users: [User] = [User()]
    
    @Published var phone: String = ""
    @Published var email: String = ""
    
    
    @Published var showAlert: Bool = false
    
    var totalPrice: Int? {
        return (bookingModel?.fuel_charge ?? 0) + (bookingModel?.service_charge ?? 0) + (bookingModel?.tour_price ?? 0)
    }
    
    func fetchData() {
            APIFetchHandler.sharedInstance.fetchAPIHotelBookingData { [self] data in
                DispatchQueue.main.async { [self] in
                    bookingModel = data
                }
            }
    }
    
    func emailIsEmpty() -> Bool {
        return email.isEmpty
    }
    
    func isWrongData() -> Bool {
        for user in users {
            if user.isFieldsEmpty {
                return true
            }
        }
        return false
    }
}

