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
    var sys: Sys?
    var wind: Wind?
    var dt: Int?
    var timezone: Int?
    var nameCity: String?
    var weather: [Weather]?
    var visibility: Double?
    var failure: String?
    private var service: HomeService = HomeService()
    weak var delegate: WeatherViewModelProtocol?
    
    func fetchWeatherDetails(city: String) {
        service.getWeatherDetailsURLSession(forCity: city) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(success)
                    self.main = success.main
                    self.sys = success.sys
                    self.dt = success.dt
                    self.timezone = success.timezone
                    self.wind = success.wind
                    self.nameCity = success.name
                    self.weather = success.weather
                    self.visibility = success.visibility
                    self.delegate?.sucessRequest()
                    print(success)
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self.failure = failure.localizedDescription
                    self.delegate?.errorRequest()
                }
            }
        }
    }
    
    func errorAPI() -> String {
        return failure ?? ""
    }
    
    func name() -> String {
        return nameCity ?? ""
    }
    
    func weatherDescription() -> String {
        return weather?[0].description ?? ""
    }
    
    func weatherIcon() -> String {
        return weather?[0].icon ?? ""
    }
    
    func windValue() -> Double {
        return wind?.speed ?? 0
    }
    
    func visibilityValue() -> Double {
        return visibility ?? 0
    }
    
    func date() -> Int {
        return dt ?? 0
    }
    
    func timezoneValue() -> Int {
        return timezone ?? 0
    }
    
    func country() -> String {
        return sys?.country ?? ""
    }
    
    func temp() -> Double {
        return main?.temp ?? 0
    }
    
    func feelsLike() -> Double {
        return main?.feelsLike ?? 0
    }
    
    func tempMin() -> Double {
        return main?.tempMin ?? 0
    }
    
    func tempMax() -> Double {
        return main?.tempMax ?? 0
    }
    
    func pressure() -> Double {
        return main?.pressure ?? 0
    }
    
    func humidity() -> Double {
        return main?.humidity ?? 0
    }
}
