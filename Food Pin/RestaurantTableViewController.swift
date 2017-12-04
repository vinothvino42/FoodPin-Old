//
//  RestaurantTableViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 03/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

//    var restaurantNames = ["Chicken Park", "Mumbai Mirchi","Little Chinese Fast Food","Capsi","Buhari","Banu Brindhavan","Chinese Fast Food","AathiKumar","Dheen","Usha Hotel","Arafa Restaurant","Chettinadu Hotel","Rushi Hotel","Selvam Hotel","Raja Hotel","KFC","CFC","Dominos","MC Donalds","Cocoa","Suguna Hotel"]
//
//
//    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
//                            "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg",
//                            "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg",
//                            "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg",
//                            "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
//                            "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
//
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
//
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//
//    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    //new array
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cocoa", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
            Restaurant(name: "Mumbai Mirchi", type: "Cafe", location: "Hong Kong", image:
            "homei.jpg", isVisited: false),
            Restaurant(name: "Little Chinese Fast Food", type: "Tea House", location: "Hong Kong", image:
                "teakha.jpg", isVisited: false),
            Restaurant(name: "Capsi", type: "Austrian / Causual Drink", location:
                "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
            Restaurant(name: "Buhari", type: "French", location: "Hong Kong",
                       image: "petiteoyster.jpg", isVisited: false),
            Restaurant(name: "Banu Brindhavan", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
                Restaurant(name: "Chinese Fast Food", type: "Bakery", location: "Hong Kong",
                image: "posatelier.jpg", isVisited: false),
                Restaurant(name: "Arafa Restaurant", type: "Chocolate", location:
                    "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
                Restaurant(name: "KFC", type: "Cafe", location: "Sydney",
                           image: "haighschocolate.jpg", isVisited: false),
                Restaurant(name: "MC Donalds", type: "American / Seafood", location:
                    "Sydney", image: "palominoespresso.jpg", isVisited: false),
                Restaurant(name: "KFC", type: "American", location: "New York", image:
                    "upstate.jpg", isVisited: false),
                Restaurant(name: "Chicken Park", type: "American", location: "New York", image:
                    "traif.jpg", isVisited: false),
                Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",
                           location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
                Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
                    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York",
                    image: "fiveleaves.jpg", isVisited: false),
                    Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York",
                               image: "cafelore.jpg", isVisited: false),
                    Restaurant(name: "Confessional", type: "Spanish", location: "New York",
                               image: "confessional.jpg", isVisited: false),
                    Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:
                        "barrafina.jpg", isVisited: false),
                    Restaurant(name: "Donostia", type: "Spanish", location: "London", image:
                        "donostia.jpg", isVisited: false),
                    Restaurant(name: "Royal Oak", type: "British", location: "London", image:
                        "royaloak.jpg", isVisited: false),
                    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London",
                               image: "caskpubkitchen.jpg", isVisited: false)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        //Creating alert sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//
//        //Handler for call action
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry there's no call feature. Please try again later", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call " + "8870595\(indexPath.row)" , style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check In" : "Check In"
//
//        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
//
//            (action: UIAlertAction) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath)
//
//            // Toggle check-in and undo-check-in
//            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
//
//        })
//
//        optionMenu.addAction(checkInAction)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//        present(optionMenu, animated: true, completion: nil)
//
//    }
    
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
