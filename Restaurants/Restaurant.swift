//
//  Restaurant.swift
//  Restaurants
//
//  Created by Kanat A on 07/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}

