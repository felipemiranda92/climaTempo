//
//  ViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 27/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        viewModel.delegate = self
        viewModel.fetchWeatherDetails()
    }
    
    func elementsConfig() {
        tempLabel.text = ""
    }
    
    func elementsAPIConfig() {
        tempLabel.text = String(viewModel.temp())
    }
}

extension HomeViewController: WeatherViewModelProtocol {
    func sucessRequest() {
        elementsAPIConfig()
    }
    func errorRequest() {
    }
}

