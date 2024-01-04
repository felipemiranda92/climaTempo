//
//  DetailsViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var backRequestButton: UIButton!
    
    weak var delegate: WeatherViewModelProtocol?
    weak var delegateTransfer: DetailsViewModelProtocol?
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        viewModel.delegate = self
        viewModel.fetchWeatherDetails(city: delegateTransfer?.transferTextFieldInfo() ?? "0")
    }
    
    @IBAction func tappedBackRequestButton(_ sender: UIButton) {
        dismiss(animated: true)
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
