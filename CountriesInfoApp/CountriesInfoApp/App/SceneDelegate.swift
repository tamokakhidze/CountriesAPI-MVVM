import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigationController = UINavigationController()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        

        if UserDefaults.standard.bool(forKey: "isFirstLogin") == false {
            navigationController = UINavigationController(rootViewController: LoginPageViewController())
            print(UserDefaults.standard.bool(forKey: "isFirstLogin"))
        }
        else {
            navigationController = UINavigationController(rootViewController: MainVC())
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
