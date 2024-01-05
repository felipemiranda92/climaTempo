//
//  PerfilViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class PerfilViewController: UIViewController {

    
    @IBOutlet weak var exitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.setTitle("Sair", for: .normal)
        exitButton.setTitleColor(UIColor.white, for: .normal)
        exitButton.backgroundColor = UIColor.orange
        exitButton.layer.cornerRadius = 5
        
        
    }
    
    @IBAction func tappedExitButton(_ sender: UIButton) {
        
        func sair() {
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
        
        let alert: UIAlertController  = UIAlertController(title: "Deseja sair?", message: "", preferredStyle: .alert)
        
        let action1: UIAlertAction = UIAlertAction(title: "Não", style: .default) {
            (action) in
            print("Default")
        }
        
        let action2: UIAlertAction = UIAlertAction(title: "Sim", style: .destructive) {
            (action) in sair()
        }
        
//        let action3: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel) {
//            (action) in print("Cancel")
//        }
        
        alert.addAction(action1)
        alert.addAction(action2)
//        alert.addAction(action3)
        
        self.present(alert, animated: true, completion: nil)
//        navigationController?.popViewController(animated: true)
//        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
