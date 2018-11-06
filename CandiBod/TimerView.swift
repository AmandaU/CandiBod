//
//  TimerView.swift
//  CandiBod
//
//  Created by Amanda Baret on 10/13/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//
import UIKit
import Foundation
@IBDesignable
public class TimerView: UIView {
    
    var strokeColor = UIColor.white
    var fillColor = UIColor.clear//circle color
    var borderWidth = CGFloat(2)//border width
    var shape = CAShapeLayer()
    var thisRet = CGRect(x: 0, y: 0, width: 0, height: 0)
    var percentDone = CGFloat(0)

    override init (frame: CGRect) {
         super.init(frame: frame)
         setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup () {
         translatesAutoresizingMaskIntoConstraints = false
    }
    
    override public func draw(_ rect: CGRect) {
        
        thisRet = rect
      
        fillColor.setFill()
        strokeColor.setStroke()
        
        let outerCircle = UIBezierPath(ovalIn: CGRect(x: borderWidth  , y: borderWidth  , width: rect.width - (borderWidth * 2), height: rect.height - (borderWidth * 2)))
        outerCircle.lineWidth = borderWidth
        
        outerCircle.stroke()
        outerCircle.fill()
      
        let innerCircle = UIBezierPath(ovalIn: CGRect(x: borderWidth * 4, y: borderWidth * 4, width:rect.width - (borderWidth * 8), height: rect.height - (borderWidth * 8)))
        innerCircle.lineWidth = borderWidth
        
        innerCircle.stroke()
        innerCircle.fill()
        
        let startAngle: CGFloat = degreesToRadians(number: -90)
        let endAngle: CGFloat = degreesToRadians(number: 270)
      
         let middleCircle = UIBezierPath(arcCenter: CGPoint(x: thisRet.midX, y: thisRet.midY), radius: thisRet.width/2 - 5, startAngle: startAngle, endAngle: endAngle, clockwise: true);
        
        shape.fillColor = UIColor.clear.cgColor;
        shape.strokeColor = strokeColor.cgColor;
        shape.backgroundColor = UIColor.clear.cgColor;
        
        shape.strokeStart = 0
        shape.strokeEnd = 1;
        shape.lineCap = CAShapeLayerLineCap.round
        shape.lineWidth = 6.0;
        shape.borderWidth = 5.0;
        shape.shouldRasterize = false;
        
        layer.addSublayer(shape);
        shape.path = middleCircle.cgPath
    }
    
    func AnimateTime(timedoneratio: CGFloat)
    {
        if(timedoneratio == 0)
        {
            percentDone = 0
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = percentDone
        
        animation.toValue = timedoneratio
        animation.duration =  timedoneratio == 0 ?  0.001 : 1
        
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false;
          
        shape.add(animation, forKey: "line")
        percentDone = timedoneratio == 1 ? 0: timedoneratio
    }
    
    func percentToRadians(percent: CGFloat) -> CGFloat {
        return ((2 * .pi) / 100) * percent
    }
    
    func degreesToRadians (number: Int) -> CGFloat {
        return CGFloat(number) * .pi / 180.0
    }
}

