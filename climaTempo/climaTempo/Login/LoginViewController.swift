//
//  LoginViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 02/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func enterActionButton(_ sender: UIButton) {
        let home = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        // Modal
//        tela02?.modalPresentationStyle = .fullScreen
//        present(tela02 ?? UIViewController(), animated: true)
        
        // Navigation
        navigationController?.pushViewController(home ?? UIViewController(), animated: true)
    }
    
    
}
