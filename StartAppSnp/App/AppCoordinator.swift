//
//  AppCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 3/15/21.
//

import UIKit

final class AppCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = StartCheckpointCoordinator().viewController
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func eventHappened(with type: Event) {
     switch type {
         case .signInButtonTapped:
            let viewController = MainCheckpointCoordinator().mainAndMenuViewController
                viewController.coordinator = self
                navigationController.pushViewController(viewController, animated: true)
         case .createAnAccountButtonTapped:
            let viewController = MainCheckpointCoordinator().mainAndMenuViewController
                viewController.coordinator = self
                navigationController.pushViewController(viewController, animated: true)
         }
     }
}
