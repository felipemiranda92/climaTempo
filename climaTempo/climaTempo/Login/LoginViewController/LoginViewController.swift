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
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
        let tabBar = UIStoryboard(name: "TabBarViewController", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
        
        navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
    }
    
    
}
