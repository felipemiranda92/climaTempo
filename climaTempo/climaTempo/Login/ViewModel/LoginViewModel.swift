//
//  LoginViewModel.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 07/01/24.
//

import Foundation
import Firebase


import Foundation
import UIKit


class LoginViewModel {
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func loginWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                Alert().setNewAlert(target: self.viewController, title: "Alerta", message: "E-mail ou senha inválidos")
            } else {
                self.navigateToTabBarController()
            }
        }
    }

    func navigateToTabBarController() {
        let vcString = String(describing: TabBarViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarViewController
        self.viewController.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
   
}
