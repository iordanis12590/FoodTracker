//
//  Meal.swift
//  FoodTracker
//
//  Created by Basys on 8/24/15.
//  Copyright (c) 2015 Basys. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var rating: Int
    var image: UIImage?
    
    // MARK: Initialization
    init?(name:String, rating: Int, image: UIImage?) {
        self.name = name
        self.rating = rating
        self.image = image
    
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
