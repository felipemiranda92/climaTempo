
import Firebase
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var recoverPasswordChangeButton: UIButton!
    @IBOutlet weak var registerChangeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
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
        
        let vcString = String(describing: RegisterViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
                        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let vcString = String(describing: RegisterViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
                        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func configElements() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.placeholder = "Digite seu e-mail"
        passwordTextField.placeholder = "Digite sua senha"
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.cornerRadius = 5.0
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
        titleLabel.text = "ClimaTempo"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .orange
        titleLabel.alpha = 1.0
        welcomeLabel.text = "Faça o seu login para saber tudo sobre o clima e tempo no mundo."
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 15)
        welcomeLabel.textColor = .gray
        welcomeLabel.alpha = 0.8
        welcomeLabel.numberOfLines = 5
        welcomeLabel.textAlignment = .justified
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.backgroundColor = UIColor.orange
        enterButton.layer.cornerRadius = 5
        registerChangeButton.setTitle("Cadastrar", for: .normal)
        registerChangeButton.setTitleColor(UIColor.orange, for: .normal)
    }
}

extension LoginViewController: UITextFieldDelegate {
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

