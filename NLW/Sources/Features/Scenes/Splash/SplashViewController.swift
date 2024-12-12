//
//  SplashViewController.swift
//  NLW
//
//  Created by Victor Vaz de Oliveira on 11/12/24.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView?
    weak var delegate: SplashFlowDelegate?
    
    init(contentView: SplashView, delegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        decideFlow()
    }
    
    private func setup() {
        guard let contentView = contentView else { return }
        
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.greenLight
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        guard let contentView = contentView else { return }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func decideFlow() {
        // Decidir se o usuário vai para home ou para a tela de dicas
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [ weak self ] in
            self?.delegate?.decideNavigationFlow()
        }
    }
}
