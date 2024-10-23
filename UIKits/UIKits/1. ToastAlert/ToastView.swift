//
//  ToastView.swift
//  UIKits
//
//  Created by minsong kim on 10/11/24.
//

import UIKit

class ToastView: UIView {
    let iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    convenience init(icon image: UIImage?, text: String) {
        self.init()
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        self.messageLabel.text = text
        
        if let image {
            self.iconImageView.image = image
            configureIconView()
        } else {
            configureLabel()
        }
    }
    
    private func configureIconView() {
        self.addSubview(iconImageView)
        self.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 4),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func configureLabel() {
        self.addSubview(messageLabel)
    
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
