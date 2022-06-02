//
//  UIView+Extention.swift
//  Navigation
//
//  Created by Бардеева Надежда on 11.05.2022.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }

    func shakeField() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 3, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 3, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
