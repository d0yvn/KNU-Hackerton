import UIKit

class MainTapController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setBarButtons()
        
    }
    
    func setBarButtons() {
        
        let homeVC = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: HomeViewController())
        
        let postVC = templateNavigationController(image: UIImage(systemName: "aspectratio"), rootViewController: PostViewController())
        
        let chatVC = templateNavigationController(image: UIImage(systemName: "message"), rootViewController: ChatViewController())
        
        let profileVC = templateNavigationController(image: UIImage(systemName: "person.crop.circle"), rootViewController: ProfileViewController())
        
        setViewControllers([homeVC,postVC,chatVC,profileVC], animated: false)
    }
    
    func templateNavigationController(image : UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        
        return nav
    }
    
    
    
}
