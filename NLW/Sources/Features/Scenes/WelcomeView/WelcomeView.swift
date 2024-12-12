//
//  WelcomeView.swift
//  NLW
//
//  Created by Victor Vaz de Oliveira on 12/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "nearbyLogo"))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Boas vindas ao Nearby!"
        label.font = Typography.titleXL
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Tenha cupons de vantagem para usar em seus estabelicimentos favoritos!"
        label.font = Typography.textMD
        label.textColor = Colors.gray500
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tipsContainerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        label.textColor = Colors.gray500
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tipsStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.titleLabel?.font = Typography.action
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor // Cor da sombra
        button.layer.shadowOpacity = 0.2 // Opacidade da sombra (0.0 a 1.0)
        button.layer.shadowOffset = CGSize(width: 0, height: 2) // Deslocamento da sombra
        button.layer.shadowRadius = 4 // Difusão da sombra
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(tipsContainerView)
        tipsContainerView.addSubview(subTextForTips)
        tipsContainerView.addSubview(tipsStackView)
        addSubview(startButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            tipsContainerView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 48),
            tipsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            tipsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
//            tipsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            subTextForTips.topAnchor.constraint(equalTo: tipsContainerView.topAnchor),
            subTextForTips.leadingAnchor.constraint(equalTo: tipsStackView.leadingAnchor),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: tipsContainerView.leadingAnchor),
            tipsStackView.trailingAnchor.constraint(equalTo: tipsContainerView.trailingAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTips() {
        guard let mapIcon = UIImage(named: "mapIcon") else { return }
        
        let mapTip = TipsView(icon: mapIcon,
                            title: "Encontre estabelecimentos",
                            description: "Veja locais perto de você que são parceiros de Neaby")
        
        let qrcodeTip = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                            title: "Ative o cupom com QR Code",
                            description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let ticketTip = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                            title: "Garanta vantagens perto de você",
                            description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(mapTip)
        tipsStackView.addArrangedSubview(qrcodeTip)
        tipsStackView.addArrangedSubview(ticketTip)
    }
}
