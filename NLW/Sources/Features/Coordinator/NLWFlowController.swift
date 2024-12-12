//
//  NLWFlowController.swift
//  NLW
//
//  Created by Victor Vaz de Oliveira on 11/12/24.
//

import Foundation
import UIKit


class NLWFlowController {
    private var navigationController: UINavigationController?
    
    public init () {
        
    }
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

extension NLWFlowController: SplashFlowDelegate {
    func decideNavigationFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeViewController(contentView: contentView)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
