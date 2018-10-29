//
//  ExerciseCell.swift
//  CandiBod
//
//  Created by Amanda Baret on 7/23/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit

public class ExerciseCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
   public override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            //do something
            super.isSelected = newValue
        }
    }
    
    public func BlurView(sourceImage: UIImage)
    {
       backgroundImage.image = sourceImage;
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame =   UIScreen.main.bounds //backgroundImage.bounds
        blurredEffectView.alpha = 0.9
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = backgroundImage.bounds
        
        blurredEffectView.contentView.addSubview(vibrancyEffectView)
        backgroundImage.addSubview(blurredEffectView)
        
        //Mask
        
        /*
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = circle.cgPath
        borderLayer.strokeColor = UIColor.white.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor //Remember this line, it caused me some issues
        borderLayer.lineWidth = 10
        
        let maskView = UIView(frame: self.view.frame)
        maskView.backgroundColor = UIColor.black
        maskView.layer.mask = maskLayer
        
        blur.layer.addSublayer(borderLayer)
        blur.mask = maskView*/
        
    }
   
}
