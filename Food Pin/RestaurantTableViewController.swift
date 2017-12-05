//
//  RestaurantTableViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 03/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants: [Restaurant] = [
        Restaurant(name: "Cocoa", type: "Coffee & Tea Shop", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870595234", image: "cafedeadend.jpg", isVisited: false),
            Restaurant(name: "Mumbai Mirchi", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8870592234", image:
            "homei.jpg", isVisited: false),
            Restaurant(name: "Little Chinese Fast Food", type: "Tea House", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8860595234", image:
                "teakha.jpg", isVisited: false),
            Restaurant(name: "Capsi", type: "Austrian / Causual Drink", location:
                "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8870595234", image: "cafeloisl.jpg", isVisited: false),
            Restaurant(name: "Buhari", type: "French", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8870495234",
                       image: "petiteoyster.jpg", isVisited: false),
            Restaurant(name: "Banu Brindhavan", type: "Bakery", location: "Shop J- K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "8870595284", image: "forkeerestaurant.jpg", isVisited: false),
                Restaurant(name: "Chinese Fast Food", type: "Bakery", location: "Shop J- K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "8878595234",
                image: "posatelier.jpg", isVisited: false),
                Restaurant(name: "Arafa Restaurant", type: "Chocolate", location:
                    "Sydney", phone: "8870595234", image: "bourkestreetbakery.jpg", isVisited: false),
                Restaurant(name: "KFC", type: "Cafe", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870795234",
                           image: "haighschocolate.jpg", isVisited: false),
                Restaurant(name: "MC Donalds", type: "American / Seafood", location:
                    "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870595234", image: "palominoespresso.jpg", isVisited: false),
                Restaurant(name: "KFC", type: "American", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870595254", image:
                    "upstate.jpg", isVisited: false),
                Restaurant(name: "Chicken Park", type: "American", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8570595234", image:
                    "traif.jpg", isVisited: false),
                Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",
                           location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870595234", image: "grahamavenuemeats.jpg", isVisited: false),
                Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "8870995234", image: "wafflewolf.jpg", isVisited: false),
                    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8880595234",
                    image: "fiveleaves.jpg", isVisited: false),
                    Restaurant(name: "Cafe Lore", type: "Latin American", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8840595234",
                               image: "cafelore.jpg", isVisited: false),
                    Restaurant(name: "Confessional", type: "Spanish", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "8860595234",
                               image: "confessional.jpg", isVisited: false),
                    Restaurant(name: "Barrafina", type: "Spanish", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "8470595234", image:
                        "barrafina.jpg", isVisited: false),
                    Restaurant(name: "Donostia", type: "Spanish", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "8770595234", image:
                        "donostia.jpg", isVisited: false),
                    Restaurant(name: "Royal Oak", type: "British", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "8870598834", image:
                        "royaloak.jpg", isVisited: false),
                    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "7770595234",
                               image: "caskpubkitchen.jpg", isVisited: false)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //Removing the back button title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Self sizing cells
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Hiding the navigation bar when swiping
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImage?.image = UIImage(named: restaurants[indexPath.row].image)
        
        //To make circular image
        cell.thumbnailImage.layer.cornerRadius = 30
        cell.thumbnailImage.clipsToBounds = true
        
        //Checking checkIn
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            //Removing all array values
            restaurants.remove(at: indexPath.row)

        }
       // tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Share Button
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let text = "Just check in at "+self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [text, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        //Delete Button
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            //Delete the data
            self.restaurants.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0,
                                             blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0,
                                               blue: 203.0/255.0, alpha: 1.0)

        
        return [deleteAction,shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailRestaurant" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
            
                destinationController.restaurants = restaurants[indexPath.row]
            }
        }
    }
}
