//
//  HomeService.swift
//  climaTempo
//
//  Created by Michael Bressiani on 29/12/23.
//

import UIKit

class HomeService: NSObject {
    
    var apiRequest: String = ""
    
    func getWeatherDetailsURLSession(forCity city: String, completion: @escaping (Result<WeatherDetails, Error>) -> Void) {
        
//        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/brazil") else { return }
        
        apiRequest = "https://api.openweathermap.org/data/2.5/weather?appid=cf9ae2982462a287e2c11d55c7704d8e&units=metric&q="
        
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=cf9ae2982462a287e2c11d55c7704d8e&units=metric&q=london") else { return }
        
        guard let url = URL(string: apiRequest + city) else { return }
        
//        let headers = [
//            "X-RapidAPI-Key": "db9e3332dcmshfc41ed0a16de062p1fd4bejsn259b7a99d49f",
//            "X-RapidAPI-Host": "open-weather13.p.rapidapi.com"
//        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            // Adicione esta linha para visualizar os dados brutos
//            print(String(data: dataResult, encoding: .utf8) ?? "")
            
            if response.statusCode == 200 {
                do {
                    let weatherDetails: WeatherDetails = try JSONDecoder().decode(WeatherDetails.self, from: dataResult)
                    completion(.success(weatherDetails))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Error ao decodificar o JSON", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
}
