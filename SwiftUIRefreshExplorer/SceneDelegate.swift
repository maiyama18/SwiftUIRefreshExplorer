import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = createTabBarViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func createTabBarViewController() -> UITabBarController {
        let custom = CustomViewController()
        custom.tabBarItem = UITabBarItem(title: "Custom", image: UIImage(systemName: "heart"), tag: 0)
        
        let uiKit = UIKitViewController()
        uiKit.tabBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "bolt"), tag: 1)
        
        let swiftUIRefresh = SwiftUIRefreshViewController()
        swiftUIRefresh.tabBarItem = UITabBarItem(title: "SwiftUIRefresh", image: UIImage(systemName: "airplane"), tag: 2)
        
        let swiftUIX = SwiftUIXViewController()
        swiftUIX.tabBarItem = UITabBarItem(title: "SwiftUIX", image: UIImage(systemName: "sum"), tag: 3)
        
        let swiftUIPullToRefresh = SwiftUIPullToRefreshViewController()
        swiftUIPullToRefresh.tabBarItem = UITabBarItem(title: "SwiftUIPullToRefresh", image: UIImage(systemName: "sum"), tag: 4)
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [custom, uiKit, swiftUIPullToRefresh, swiftUIX, swiftUIRefresh]
        tabBarViewController.selectedIndex = 0
        return tabBarViewController
    }
}

