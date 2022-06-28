import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      window = UIWindow(windowScene: windowScene)
      let controller = RecipeModuleBuilder().view()
      window?.rootViewController =  UINavigationController(rootViewController: controller)
      window?.makeKeyAndVisible()
    }
}

