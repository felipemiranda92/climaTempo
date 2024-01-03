//
//  DetailsViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    
    weak var delegate: WeatherViewModelProtocol?
    weak var delegateTransfer: DetailsViewModelProtocol?
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        viewModel.delegate = self
        viewModel.fetchWeatherDetails(city: delegateTransfer?.transferTextFieldInfo() ?? "0")
    }
    
        func elementsConfig() {
            tempLabel.text = ""
        }
    
        func elementsAPIConfig() {
            tempLabel.text = String(viewModel.temp())
        }
}

extension DetailsViewController: WeatherViewModelProtocol {
    func sucessRequest() {
         elementsAPIConfig()
    }
    func errorRequest() {
    }
}
