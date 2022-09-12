//
//  ActivityIndicator+Utility.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation
import UIKit
/// UIActivityIndicatorView extension to configure the functionality of indicator view
extension UIActivityIndicatorView {

    private func configure(with view: UIView) -> UIActivityIndicatorView {
        self.color = UIColor.brown
        self.center = view.center
        self.startAnimating()
        return self
    }
    
    func show(with view: UIView) {
        view.addSubview(configure(with: view))
    }
    
    func hide() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
}

