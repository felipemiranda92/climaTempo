//
//  ViewController.swift
//  climaTempo
//
//  Created by Felipe Miranda Santos on 27/12/23.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    @IBOutlet weak var requestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
