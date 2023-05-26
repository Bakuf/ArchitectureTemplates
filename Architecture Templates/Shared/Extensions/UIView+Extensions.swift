//
//  UIView+Extensions.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 18/05/23.
//

import UIKit

extension UIView {
    
    func removeAllSubviews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func addSubviewWithBorderLayout(subView: UIView) {
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subView.topAnchor.constraint(equalTo: self.topAnchor),
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
