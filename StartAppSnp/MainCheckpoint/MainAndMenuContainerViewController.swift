//
//  MainAndMenuContainerViewController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/20/21.
//

import UIKit
import SnapKit

final class MainAndMenuContainerViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    enum MenuState {
        case open
        case close
    }
    
    private var menuState: MenuState = .close
    
    private let mainViewController =  MainCheckpointCoordinator().viewController
    private let menuViewController = MenuViewCoordinator().viewController
    
    private lazy var mainNavigationViewController = UINavigationController(rootViewController: mainViewController).do {
        $0.view.layer.masksToBounds = true
    }
    
    private let animationDuration: TimeInterval = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController.delegate = self
        menuViewController.delegate = self
        
        setupChildSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        mainNavigationViewController.navigationBar.barTintColor = .white
        mainNavigationViewController.navigationBar.shadowImage = UIImage()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupChildSubviews() {
        addChilds(menuViewController,
                  mainNavigationViewController)
        
        view.addSubviews(menuViewController.view,
                         mainNavigationViewController.view)
        
        menuViewController.didMove(toParent: self)
        mainNavigationViewController.didMove(toParent: self)
    }
}

extension MainAndMenuContainerViewController: MainCheckpointViewControllerDelegate {
    func menuButtonDidTap() {
        if menuState == .close {
            self.mainNavigationViewController.view.layer.cornerRadius = 44
            
            UIView.animate(withDuration: animationDuration) {
                self.mainNavigationViewController.view.transform = CGAffineTransform(translationX: 200, y: 0)
                    .scaledBy(x: 0.75, y: 0.75)
                    .rotated(by: -0.2)
            } completion: { [weak self] in
                if $0 {
                self?.menuState = .open
                }
            }
        }
    }
}
    


extension MainAndMenuContainerViewController: MenuViewControllerDelegate {
    func closeButtonDidTap() {
        if menuState == .open {
            UIView.animate(withDuration: animationDuration) {
                self.mainNavigationViewController.view.layer.cornerRadius = 0
                self.mainNavigationViewController.view.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { [weak self] in
                if $0 {
                self?.menuState = .close
                }
            }
        }
    }
}
