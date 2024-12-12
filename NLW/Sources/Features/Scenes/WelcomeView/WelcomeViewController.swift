//
//  WelcomeViewController.swift
//  NLW
//
//  Created by Victor Vaz de Oliveira on 12/12/24.
//

import Foundation
import UIKit


class WelcomeViewController: UIViewController {
    let contentView: WelcomeView?
    
    init(contentView: WelcomeView) {
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        guard let contentView = contentView else { return }
        
        self.view.addSubview(contentView)
        view.backgroundColor = Colors.gray100
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.setupContentViewToViewController(contentView: contentView)
    }
}
