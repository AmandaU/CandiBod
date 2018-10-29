//
//  FullPageFlowLayout.swift
//  CandiBod
//
//  Created by Amanda Baret on 8/17/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit

class FullPageFlowLayout: UICollectionViewFlowLayout {
  
/*
    // create an event
    let event = Event<(String, String)>()
    
    // add a handler
    let handler = event.addHandler(self, ViewController.handleEvent)
    
    func handleEvent(data: (String, String)) {
        println("Hello \(data.0), \(data.1)")
    }
    */
    var lastcontentOffset = 0
    var  currentItemIdx = 0
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true;
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard collectionView != nil else
        {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset,withScrollingVelocity: velocity)
       }
        
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity);
        var havePaged = false
        // Skip to the next cell, if there is residual scrolling velocity left.
        let vX = velocity.x;
        if (vX > 0)
        {
            //  ScrollDirectionForward?.Invoke(false);
            if (currentItemIdx < 5 - 1)
            {
                currentItemIdx += 1;
                havePaged = true
            }
        }
        else if (vX < 0)
        {
            //  ScrollDirectionForward?.Invoke(true);
            if (currentItemIdx > 0)
            {
                currentItemIdx -= 1;
                havePaged = true
            }
        }
        if (havePaged)
        {
            //CandiBodViewController.instance?.SelectedWorkout(id:currentItemIdx)
        }
        CandiBodViewController.instance?.WorkoutSelected(index:currentItemIdx)
        let nearestPageOffset = Double(currentItemIdx) * Double(UIScreen.main.bounds.width);
        return CGPoint(x: CGFloat(nearestPageOffset), y: parent.y)
        
    }
    
}
