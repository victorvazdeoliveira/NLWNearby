//
//  UIViewController+Extension.swift
//  NLW
//
//  Created by Victor Vaz de Oliveira on 12/12/24.
//

import Foundation
import UIKit


extension UIViewController {
    func setupContentViewToViewController(contentView: UIView?) {
        guard let contentView = contentView else { return }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
