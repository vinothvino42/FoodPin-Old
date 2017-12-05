//
//  Restaurant.swift
//  Food Pin
//
//  Created by Vinoth Vino on 04/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var phone = ""
    var image = ""
    var isVisited = false
    var rating = ""
    
    init(name: String, type: String, location: String, phone: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}
