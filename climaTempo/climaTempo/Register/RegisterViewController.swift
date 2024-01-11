//
//  RegisterViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 09/01/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var haveaccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        configElements()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    Alert().setNewAlert(target: self, title: "Email ou senha inválidos", message: "")
                } else {
                    let vcString = String(describing: TabBarViewController.self)
                    let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarViewController
                    self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
                }
            }
    }
    
    
    @IBAction func tappedLogin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func configElements() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.backgroundColor = .systemBackground
        titleLabel.text = "ClimaTempo"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .orange
        titleLabel.alpha = 1.0
        
        descriptionLabel.text = "Faça seu cadastro"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 15)
        descriptionLabel.textColor = .gray
        descriptionLabel.alpha = 0.8
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textAlignment = .justified
        
        nameTextField.placeholder = "Digite seu nome"
        
        emailTextField.placeholder = "Digite seu e-mail"
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.isSecureTextEntry = true
        
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = UIColor.orange
        registerButton.layer.cornerRadius = 5
        
        haveaccountButton.setTitle("Já tem conta?", for: .normal)
        haveaccountButton.setTitleColor(UIColor.orange, for: .normal)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.cornerRadius = 5.0
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
                
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
