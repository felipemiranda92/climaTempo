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
        configElements()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    Alert().setNewAlert(target: self, title: "Alerta", message: "Erro : \(error.localizedDescription)")
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
        view.backgroundColor = .systemBackground
        titleLabel.text = "ClimaTempo"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemBlue
        titleLabel.alpha = 1.0
        
        descriptionLabel.text = "Faça seu cadastro"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 15)
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .gray
        descriptionLabel.alpha = 0.8
        
        nameTextField.placeholder = "Digite seu nome"
        
        emailTextField.placeholder = "Digite seu e-mail"
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.isSecureTextEntry = true
        
        registerButton.setTitle("Cadastrar", for: .normal)
    }
    

}
