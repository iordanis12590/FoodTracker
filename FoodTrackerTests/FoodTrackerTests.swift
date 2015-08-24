//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Basys on 8/22/15.
//  Copyright (c) 2015 Basys. All rights reserved.
//

import UIKit
import XCTest

class FoodTrackerTests: XCTestCase {
    
  // MARK: Foodtracker tests
    func testMealInitialization() {
        
        //Success case
        let potentialItem = Meal(name: "Beans", rating: 5, image: nil)
        XCTAssertNotNil(potentialItem)
        
        //Failure case
        let noName = Meal(name: "", rating: 4, image: nil)
        XCTAssertNil(noName, "Empty name is invalid")
        
        //Waggy case
        let badRating = Meal(name: "Bad bean", rating: -1, image: nil)
        XCTAssertNil(badRating, "Youuu smelly bean")
    }
}
