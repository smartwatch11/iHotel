//
//  HotelViewModel.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI
import Combine

class HotelViewModel: ObservableObject {
    
    @Published var hotelModel: HotelModel?
    @Published var images: [(url: String, image: UIImage)] = []
    
    func fetchData() {
            APIFetchHandler.sharedInstance.fetchAPIHotelData { [self] data in
                DispatchQueue.main.async { [self] in
                    hotelModel = data
                    takeImages(urls: hotelModel?.image_urls ?? [])
                }
            }
    }
    
    private func takeImages(urls: [String]){
        DispatchQueue.global().async {
            var images: [(url: String, image: UIImage)] = []
            
            for url in urls {
                guard let urlImage = URL(string: url), let imageData = try? Data(contentsOf: urlImage), let image = UIImage(data: imageData) else {return}
                images.append((url: url, image: image))
            }
            
            DispatchQueue.main.async {
                self.images = images
            }
        }
    }
}
