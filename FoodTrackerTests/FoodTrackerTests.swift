//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by buyan on 15/11/2016.
//  Copyright © 2016 buyan. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // foodtracker test
    
    // test for init
    func testMealInitialization(){
        // source case
        let potentialItem = Meal(name: "new meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "empty name is invalid")
        
        let badRating = Meal(name: "bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
    }
    
    
}
