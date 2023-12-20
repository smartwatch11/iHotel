//
//  RoomsViewModel.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI
import Combine

class RoomsViewModel: ObservableObject {
    @Published var roomsModel: Rooms?
    @Published var images: [(url: String, image: UIImage)] = []
    
    func fetchData() {
            APIFetchHandler.sharedInstance.fetchAPIHotelRoomsData { [self] data in
                DispatchQueue.main.async { [self] in
                    roomsModel = data
                    takeImages(urls: data.rooms.flatMap {$0.image_urls})
                }
            }
    }
    
    private func takeImages(urls: [String]){
        DispatchQueue.global().async {
            var images: [(url: String, image: UIImage)] = []
            
            for url in urls {
                if url == "https://www.google.com/search?q=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM" {
                    guard let urlImage = URL(string: "https://tophotels.ru/icache/hotel_photos/12/7/189422/2218259_740x550.jpg"), let imageData = try? Data(contentsOf: urlImage), let image = UIImage(data: imageData) else {return}
                    images.append((url: url, image: image))
                } else if url == "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=" {
                    guard let urlImage = URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/1d/df/05/b6/premier-le-reve-hotel.jpg"), let imageData = try? Data(contentsOf: urlImage), let image = UIImage(data: imageData) else {return}
                    images.append((url: url, image: image))
                } else {
                    guard let urlImage = URL(string: url), let imageData = try? Data(contentsOf: urlImage), let image = UIImage(data: imageData) else {return}
                    images.append((url: url, image: image))
                    
                }
                
            }
            
            DispatchQueue.main.async {
                self.images = images
            }
        }
    }
    
}
