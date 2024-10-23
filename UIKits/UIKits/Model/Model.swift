//
//  Model.swift
//  UIKits
//
//  Created by minsong kim on 10/23/24.
//

import UIKit

enum Model: CaseIterable {
    case toastView
    
    var title: String {
        switch self {
        case .toastView:
            "ToastView"
        }
    }
    
    var NextViewController: UIViewController {
        switch self {
        case .toastView:
            ToastViewController()
        }
    }
}
