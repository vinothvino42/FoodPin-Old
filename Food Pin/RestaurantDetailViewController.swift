//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 04/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    var restaurantImage = ""
    var restaurantNameStr = ""
    var restaurantTypeStr = ""
    var restaurantLocationStr = ""
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantType: UILabel!
    @IBOutlet var restaurantLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImage)
        restaurantName.text = restaurantNameStr
        restaurantType.text = restaurantTypeStr
        restaurantLocation.text = restaurantLocationStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
