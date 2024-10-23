//
//  ToastViewController.swift
//  UIKits
//
//  Created by minsong kim on 10/23/24.
//

import Combine
import UIKit

class ToastViewController: UIViewController, ToastProtocol {
    var window: UIWindow?
    private var cancellable = Set<AnyCancellable>()
    
    private let withIconButton: UIButton = {
        let button = UIButton()
        button.setTitle("with Icon", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.layer.shadowColor = UIColor.systemMint.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 0, height: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let withoutIconButton: UIButton = {
        let button = UIButton()
        button.setTitle("without Icon", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.layer.shadowColor = UIColor.systemPink.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 0, height: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "ToastAlert"
        
        configureUI()
        bind()
    }
    
    private func bind() {
        withIconButton.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.showToast(icon: .checkmark, message: "ToastAlert With Icon")
            }
            .store(in: &cancellable)
        
        withoutIconButton.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.showToast(icon: nil, message: "ToastAlert Without Icon")
            }
            .store(in: &cancellable)
    }
    
    private func configureUI() {
        view.addSubview(withIconButton)
        view.addSubview(withoutIconButton)
        
        NSLayoutConstraint.activate([
            withIconButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withIconButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            withIconButton.heightAnchor.constraint(equalToConstant: 20),
            withIconButton.widthAnchor.constraint(equalToConstant: 100),
            
            withoutIconButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withoutIconButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            withoutIconButton.heightAnchor.constraint(equalToConstant: 20),
            withoutIconButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
