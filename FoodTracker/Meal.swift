//
//  Meal.swift
//  FoodTracker
//
//  Created by buyan on 16/11/2016.
//  Copyright © 2016 buyan. All rights reserved.
//

import UIKit

class Meal{
    var name:String
    var photo:UIImage?
    var rating:Int
    
    // initialization
    init?(name:String, photo:UIImage?, rating:Int){
        self.name=name
        self.photo=photo
        self.rating=rating
        if name.isEmpty || rating<0{
            return nil
        }
    }
}
