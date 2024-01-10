//
//  LoginViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 02/01/24.
//
import Firebase
import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var recoverPasswordChangeButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var loginGoogleChangeButton: UIButton!
    @IBOutlet weak var loginFacebookChangeButton: UIButton!
    @IBOutlet weak var registerChangeButton: UIButton!
    
    var viewModel: LoginViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel(viewController: self)
        configElements()
        
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        viewModel?.loginWithEmail(email: email, password: password)
    }
    
    
    @IBAction func tappedRecoverPasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedGoogleButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedFacebookButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
                let vcString = String(describing: RegisterViewController.self)
                let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
                navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
    func configElements() {
        emailTextField.placeholder = "Digite seu e-mail"
        passwordTextField.placeholder = "Digite sua senha"
        emailTextField.layer.borderWidth = 1.0

        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor

        recoverPasswordChangeButton.setTitle("Esqueceu a senha?", for: .normal)
        recoverPasswordChangeButton.tintColor = UIColor.gray
        recoverPasswordChangeButton.configuration?.titleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.systemFont(ofSize: 14)
                return outgoing
            }


        orLabel.text = "ou"
        orLabel.font = UIFont.systemFont(ofSize: 15)
        orLabel.textColor = UIColor.gray

        loginGoogleChangeButton.setTitle("Entrar com o Google", for: .normal)
        loginGoogleChangeButton.tintColor = UIColor.black
        loginGoogleChangeButton.layer.borderWidth = 1.0 
        loginGoogleChangeButton.layer.borderColor = UIColor.black.cgColor

        // Opcional: Arredondar as bordas do botão
        loginGoogleChangeButton.layer.cornerRadius = 8.0

        loginFacebookChangeButton.setTitle("Entrar com o Facebook", for: .normal)
        loginFacebookChangeButton.tintColor = UIColor.black
        loginFacebookChangeButton.layer.borderWidth = 1.0
        loginFacebookChangeButton.layer.borderColor = UIColor.black.cgColor
        

        // Opcional: Arredondar as bordas do botão
        loginFacebookChangeButton.layer.cornerRadius = 8.0

        registerChangeButton.setTitle("Cadastrar", for: .normal)


    }
    
    
    
    
}
