//
//  HomeViewModel.swift
//  climaTempo
//
//  Created by Michael Bressiani on 29/12/23.
//

import UIKit

class HomeViewModel: NSObject {
    
    var main: Main?
    
    private var service: HomeService = HomeService()
    
    func fetchWatherDetails() {
        service.getWatherDetailsURLSession { result in
            switch result {
            case .success(let success):
//                print(success)
//                print(success.weather)
                self.main = success.main
                print(self.main ?? 0)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
