//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Basys on 8/23/15.
//  Copyright (c) 2015 Basys. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing  = 5
    var stars = 5
    
    // MARK: Initialization
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")
        
        for i in 0..<stars {
            println(i)
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
//            button.setImage(filledStarImage, forState: .Highlighted)
            button.setImage(filledStarImage, forState: UIControlState.Highlighted | UIControlState.Selected)
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = 44
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in enumerate(ratingButtons) {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionState()
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
//        println("Button pressed (y)")
        
        rating = find(ratingButtons, button)! + 1
        
        println(rating)
        
        updateButtonSelectionState()
    }
    
    func updateButtonSelectionState() {
        for (index, button) in enumerate(ratingButtons) {
            button.selected = index < rating
        }
    }

}
