//
//  APIFetchHandler.swift
//  iHotel
//
//  Created by Egor Rybin on 20.12.2023.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    
    func fetchAPIHotelData(url: String = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473", complition: @escaping (HotelModel)->()) {

      AF.request(url, method: .get)
        .response{ resp in
            switch resp.result{
              case .success(let data):
                if let data = data {
                    do{
                        let jsonData = try JSONDecoder().decode(HotelModel.self, from: data)
                        complition(jsonData)
                   } catch {
                      print(error.localizedDescription)
                   }
                } else {
                    print("empty response")
                }
             case .failure(let error):
                print(error.localizedDescription)
             }
        }
   }
    
    func fetchAPIHotelRoomsData(url: String = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195", complition: @escaping (Rooms)->()) {

      AF.request(url, method: .get)
        .response{ resp in
            switch resp.result{
              case .success(let data):
                if let data = data {
                    do{
                        let jsonData = try JSONDecoder().decode(Rooms.self, from: data)
                        complition(jsonData)
                   } catch {
                      print(error.localizedDescription)
                   }
                } else {
                    print("empty response")
                }
             case .failure(let error):
                print(error.localizedDescription)
             }
        }
   }
    
    func fetchAPIHotelBookingData(url: String = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff", complition: @escaping (BookingModel)->()) {

      AF.request(url, method: .get)
        .response{ resp in
            switch resp.result{
              case .success(let data):
                if let data = data {
                    do{
                        let jsonData = try JSONDecoder().decode(BookingModel.self, from: data)
                        complition(jsonData)
                   } catch {
                      print(error.localizedDescription)
                   }
                } else {
                    print("empty response")
                }
             case .failure(let error):
                print(error.localizedDescription)
             }
        }
   }
}
