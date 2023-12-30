//
//  HomeViewModel.swift
//  climaTempo
//
//  Created by Michael Bressiani on 29/12/23.
//

import UIKit

protocol WeatherViewModelProtocol: AnyObject {
    func sucessRequest()
    func errorRequest()
}

class HomeViewModel: NSObject {
    
    var main: Main?
    private var service: HomeService = HomeService()
    weak var delegate: WeatherViewModelProtocol?
    
    func fetchWeatherDetails() {
        service.getWeatherDetailsURLSession { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(success)
                    self.main = success.main
                    self.delegate?.sucessRequest()
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self.delegate?.errorRequest()
                }
            }
        }
    }
    
    func temp() -> Double {
        return main?.temp ?? 0
    }
}
