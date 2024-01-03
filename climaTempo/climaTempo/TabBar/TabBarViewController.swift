//
//  TabBarViewController.swift
//  climaTempo
//
//  Created by Michael Bressiani on 03/01/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        addControllers()
    }
    
    func addControllers() {
        
        let firstVC: UINavigationController = {
            let vc = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle.fill"), tag: 0)
            return nav
        }()
        
        //        let secondVC: UINavigationController = {
        //            let vc = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
        //            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
        //            nav.tabBarItem = UITabBarItem(title: "Tela 02", image: UIImage(systemName: "rectangle.portrait.and.arrow.right.fill"), tag: 1)
        //            return nav
        //        }()
        
        viewControllers = [firstVC]
    }
    
}
