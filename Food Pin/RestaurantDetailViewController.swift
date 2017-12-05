//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 04/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurants: Restaurant!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.8)
        tableView.tableFooterView = UIView(frame: .zero)
        
        restaurantImageView.image = UIImage(named: restaurants.image)
        
        //Setting navigation bar title as restaurant name
        title = restaurants.name
        
        //Self sizing cells
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Showing the navigation bar
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        print("Review view closed")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurants.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurants.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurants.location
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurants.phone
        case 4:
            cell.fieldLabel.text = "You're here ?"
            cell.valueLabel.text = (restaurants.isVisited) ? "Yes" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
