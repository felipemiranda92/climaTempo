//
//  DetailsViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var dateHourTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
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
            dateLabel.text = ""
            descriptionLabel.text = "Carregando ..."
            windSpeedLabel.text = "Carregando ..."
            pressureLabel.text = "Carregando ..."
            humidityLabel.text = "Carregando ..."
            visibilityLabel.text = "Carregando ..."
            dateLabel.text = "Carregando ..."
            
            
            dateHourTitleLabel.text = "Data e hora locais:"
            dateHourTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            
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
    
        func elementsAPIConfigSuccess() {
                
            tempLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            tempLabel.text = String(viewModel.temp()) + "°C"
                
            nameCityLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            nameCityLabel.text = viewModel.name() + ", " + viewModel.country()
            nameCityLabel.numberOfLines = 3
            
            let timeZoneOffsetInSeconds = viewModel.timezoneValue()
            let unixTimestamp: TimeInterval = TimeInterval(viewModel.date())
            let dateFormatter = DateFormatter()
            let timeZone = TimeZone(secondsFromGMT: timeZoneOffsetInSeconds)
            dateFormatter.timeZone = timeZone
            let date = Date(timeIntervalSince1970: unixTimestamp)
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: date)
            
            dateLabel.text = dateString
            dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
            
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
    func elementsAPIConfigError() {
        tempLabel.text = "ERRO"
        dateLabel.text = ""
        nameCityLabel.text = "ERRO"
        descriptionLabel.text = "ERRO"
        windSpeedLabel.text = "ERRO"
        pressureLabel.text = "ERRO"
        humidityLabel.text = "ERRO"
        visibilityLabel.text = "ERRO"
        dateLabel.text = "ERRO"
        
        tempLabel.textColor = UIColor.red
        nameCityLabel.textColor = UIColor.red
        descriptionLabel.textColor = UIColor.red
        windSpeedLabel.textColor = UIColor.red
        pressureLabel.textColor = UIColor.red
        humidityLabel.textColor = UIColor.red
        visibilityLabel.textColor = UIColor.red
        dateLabel.textColor = UIColor.red
        
        dateHourTitleLabel.text = "Data e hora locais:"
        dateHourTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
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
        
        let alert: UIAlertController  = UIAlertController(title: "Cidade ou estado inválido", message: "", preferredStyle: .alert)
        
        let action1: UIAlertAction = UIAlertAction(title: "Voltar", style: .default) {
            (action) in self.dismiss(animated: true)
        }
        
        alert.addAction(action1)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailsViewController: WeatherViewModelProtocol {
    func sucessRequest() {
         elementsAPIConfigSuccess()
    }
    func errorRequest() {
        elementsAPIConfigError()
    }
}
