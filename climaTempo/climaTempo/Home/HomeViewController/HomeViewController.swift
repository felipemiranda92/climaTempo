//
//  ViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 27/12/23.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleAppLabel: UILabel!
    @IBOutlet weak var descriptionAppLabel: UILabel!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleAppLabel.text = "climaTempo"
        titleAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    
        descriptionAppLabel.text = "Bem vindo ao climaTempo, aqui você pode consultar informações metereológicas de cidades, municipios e estados, de qualquer lugar do mundo, mas atenção certifique-se que a ortografia esteja correta."
        descriptionAppLabel.numberOfLines = 5
        descriptionAppLabel.textAlignment = .justified
        
        cityNameTextField.placeholder = "Digite o nome da cidade"
        
        requestButton.setTitle("Realizar pesquisa", for: .normal)
        requestButton.setTitleColor(UIColor.white, for: .normal)
        requestButton.backgroundColor = UIColor.orange
        requestButton.layer.cornerRadius = 5
    }
    
    @IBAction func tappedRequestButton(_ sender: UIButton) {

        let details = UIStoryboard(name: "DetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        details?.delegateTransfer = self
        
        details?.modalPresentationStyle = .fullScreen
        present(details ?? UIViewController(), animated: true)
    }
}

extension HomeViewController: DetailsViewModelProtocol {
    func transferTextFieldInfo() -> String {
        return cityNameTextField.text ?? "0"
    }
}
