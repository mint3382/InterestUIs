//
//  ToastProtocol.swift
//  UIKits
//
//  Created by minsong kim on 10/23/24.
//

import UIKit

protocol ToastProtocol where Self: UIViewController {
    var window: UIWindow? { get set }
}

extension ToastProtocol {
    func showToast(icon: UIImage?, message: String) {
        let toastLabel = ToastView(icon: icon, text: message)
        toastLabel.frame = CGRect(x: Int(self.view.frame.minX) + 16, y: Int(self.view.frame.midY), width: Int(self.view.frame.width) - 32, height: 50)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        window?.windowLevel = .alert
        window?.isUserInteractionEnabled = false
        window?.addSubview(toastLabel)
        
        self.window?.isHidden = false
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseOut, animations: {
            self.window?.alpha = 0.0
        }) { _ in
            self.window?.alpha = 1.0
            self.window?.isHidden = true
        }
    }
}
