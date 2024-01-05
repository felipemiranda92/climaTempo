//
//  DetailsViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var iconWeatherImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var titlePressureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var titleHumidityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var titleVisibilityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    @IBOutlet weak var backRequestButton: UIButton!
    
    var descriptionText: String = ""
    weak var delegate: WeatherViewModelProtocol?
    weak var delegateTransfer: DetailsViewModelProtocol?
    var viewModel: HomeViewModel = HomeViewModel()
    var fontSizeText: Int = 18
    
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
            
            tempLabel.text = "Carregando ..."
            nameCityLabel.text = "Carregando ..."
            descriptionLabel.text = "Carregando ..."
            windSpeedLabel.text = "Carregando ..."
            pressureLabel.text = "Carregando ..."
            humidityLabel.text = "Carregando ..."
            visibilityLabel.text = "Carregando ..."
            
            windLabel.text = "Vento:"
            windLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            titlePressureLabel.text = "Pressão:"
            titlePressureLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            titleHumidityLabel.text = "Umidade:"
            titleHumidityLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            titleVisibilityLabel.text = "Visibilidade:"
            titleVisibilityLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            
            backRequestButton.setTitle("Realizar nova pesquisa", for: .normal)
            backRequestButton.setTitleColor(UIColor.white, for: .normal)
            backRequestButton.backgroundColor = UIColor.orange
            backRequestButton.layer.cornerRadius = 5
        }
    
        func elementsAPIConfig() {
            
            tempLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            tempLabel.text = String(viewModel.temp()) + "°C"
            
            nameCityLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            nameCityLabel.text = viewModel.name()
            
            iconWeatherImageView.image = UIImage(named: viewModel.weatherIcon())
            
            descriptionText = "Característa geral do clima: " + viewModel.weatherDescription() + ". Sensação térmica de " + String(viewModel.feelsLike()) + "°C" + " e máxima pode chegar a "  + String(viewModel.tempMax()) + "°C" + " enquanto a mínima fica em torno de " + String(viewModel.tempMin()) + "°C" + "."
            descriptionLabel.numberOfLines = 5
            descriptionLabel.textAlignment = .justified
            
            descriptionLabel.text = descriptionText
            
            windSpeedLabel.text = String(Int(viewModel.windValue()*3.6)) + " km/h"
            
            titlePressureLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            pressureLabel.text = String(Int(viewModel.pressure())) + " hPa"
            
            titleHumidityLabel.text = "Umidade:"
            titleHumidityLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            humidityLabel.text = String(Int(viewModel.humidity())) + "%"
            
            titleVisibilityLabel.text = "Visibilidade:"
            titleVisibilityLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeText), weight: .semibold)
            if viewModel.visibilityValue() >= 10000 {
                visibilityLabel.text = String(Int(viewModel.visibilityValue()/1000)) + " km"
            } else {
                visibilityLabel.text = String(Int(viewModel.visibilityValue())) + " km"
            }
            
        }
}

extension DetailsViewController: WeatherViewModelProtocol {
    func sucessRequest() {
         elementsAPIConfig()
    }
    func errorRequest() {
    }
}
