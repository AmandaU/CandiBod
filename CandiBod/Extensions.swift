//
//  Extensions.swift
//  CandiBod
//
//  Created by Amanda Baret on 10/23/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        
        layer.removeAllAnimations()
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
     }
  
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
