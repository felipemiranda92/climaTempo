
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
            nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
            return nav
        }()
        
        let secondVC: UINavigationController = {
            let vc = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
                nav.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person.fill"), tag: 1)
            return nav
        }()
        
        viewControllers = [firstVC, secondVC]
    }
    
}
