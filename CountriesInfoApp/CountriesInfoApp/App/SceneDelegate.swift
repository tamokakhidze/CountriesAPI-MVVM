import UIKit

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//    var navigationController = UINavigationController()
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        
//        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//        //var navigationController = UINavigationController()
//        if LoginPageViewController().isFirstLogin() {
//            navigationController = UINavigationController(rootViewController: LoginPageViewController())
//        }
//        else {
//            navigationController = UINavigationController(rootViewController: MainVC())
//        }
//        //let navigatioController = UINavigationController(rootViewController: LoginPageViewController())
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//    }
//}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: LoginPageViewController())
        //let navigatioController = UINavigationController(rootViewController: LoginPageViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
