//
//  WorkoutView.swift
//  CandiBod
//
//  Created by Amanda Baret on 8/26/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//
import UIKit
@IBDesignable
public class WorkoutView: UIView {

    
    public  var Index = 0
    
    @IBAction func ButtonClick(_ sender: Any) {
        CandiBodViewController.instance?.WorkoutSelected(index: Index)
    }
   
    @IBOutlet weak var WhiteLineView: UIView!
    
     @IBOutlet weak var WorkoutButton: UIButton!
    // MARK: init methods
    
   
    public func Select()
    {
       self.WhiteLineView.backgroundColor = UIColor.clear
    }
    
    public func UnSelect()
    {
       self.WhiteLineView.backgroundColor =  UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonSetup()
    }
    
    override public func layoutSubviews() {
       
        WorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        WhiteLineView.translatesAutoresizingMaskIntoConstraints = false
        WhiteLineView.clipsToBounds = true
        WhiteLineView.layer.borderWidth = 1
        WhiteLineView.layer.borderColor = UIColor.white.cgColor
        WhiteLineView.layer.cornerRadius = 3
    }
    
    required public init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup(){
        translatesAutoresizingMaskIntoConstraints = false
        
        }
}
