//
//  SceneDelegate.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 2/5/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigationController: UINavigationController = .translucentNavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.backgroundColor = .backgroundColor
     //   window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        
        appCoordinator?.start()
    }
}

