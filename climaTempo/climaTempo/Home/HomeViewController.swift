//
//  ViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 27/12/23.
//

import UIKit

protocol TextFieldProtocol: AnyObject {
    func didEnterText(_ text: String)
}

class HomeViewController: UIViewController {
    
  
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var requestButton: UIButton!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        viewModel.delegate = self
    }
    
    @IBAction func requestActionButton(_ sender: UIButton) {
        viewModel.fetchWeatherDetails(city: cityNameTextField.text ?? "")
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

