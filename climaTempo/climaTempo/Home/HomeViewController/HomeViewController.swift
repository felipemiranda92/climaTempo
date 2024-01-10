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
    
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
    }
    
    func elementsConfig() {
        cityNameTextField.delegate = self
        titleAppLabel.text = "climaTempo"
        titleAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    
        descriptionAppLabel.text = "Bem vindo ao climaTempo, aqui você pode consultar informações metereológicas de cidades ou estados, de qualquer lugar do mundo, mas atenção certifique-se que a ortografia esteja correta."
        descriptionAppLabel.numberOfLines = 5
        descriptionAppLabel.textAlignment = .justified
        
        cityNameTextField.placeholder = "Digite o nome da cidade"
        
        requestButton.setTitle("Realizar pesquisa", for: .normal)
        requestButton.setTitleColor(UIColor.white, for: .normal)
        requestButton.backgroundColor = UIColor.orange
        requestButton.layer.cornerRadius = 5
        
        invalidLabel.text = ""
        
    }
    
    @IBAction func tappedRequestButton(_ sender: UIButton) {
        
        if cityNameTextField.text == "" {
            let alert: UIAlertController  = UIAlertController(title: "Preenchimento obrigatório", message: "", preferredStyle: .alert)
            
            let action1: UIAlertAction = UIAlertAction(title: "Voltar", style: .default) {
                (action) in print("Default")
            }
            
            alert.addAction(action1)
            
            self.present(alert, animated: true, completion: nil)
        } else {
            
            let details = UIStoryboard(name: "DetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
            details?.delegateTransfer = self
            
            details?.modalPresentationStyle = .fullScreen
            present(details ?? UIViewController(), animated: true)
        }
    }
}

extension HomeViewController: DetailsViewModelProtocol {
    func transferTextFieldInfo() -> String {
        return cityNameTextField.text ?? "0"
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.cornerRadius = 5.0
        invalidLabel.text = ""
    }
        
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        if textField.hasText {
            textField.layer.borderColor = UIColor.lightGray.cgColor
                
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
            
        if !textField.isFirstResponder {
            if textField.text == "" {
                textField.layer.borderColor = UIColor.red.cgColor
                invalidLabel.font = UIFont.systemFont(ofSize: 15)
                invalidLabel.textColor = UIColor.red
                invalidLabel.text = "Preenchimento obrigatório"
                
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                invalidLabel.text = ""
            }
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
