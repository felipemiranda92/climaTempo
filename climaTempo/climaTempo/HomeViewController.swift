//
//  ViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 27/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchWeatherDetails()
    }


}

