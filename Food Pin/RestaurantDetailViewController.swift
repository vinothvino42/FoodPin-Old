//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 04/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    var restaurants: Restaurant!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantType: UILabel!
    @IBOutlet var restaurantLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurants.image)
        restaurantName.text = restaurants.name
        restaurantType.text = restaurants.type
        restaurantLocation.text = restaurants.location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
