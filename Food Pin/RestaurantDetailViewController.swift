//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 04/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurants: Restaurant!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tapGestureRecognizer)

        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.8)
        
        restaurantImageView.image = UIImage(named: restaurants.image)
        
        //Setting navigation bar title as restaurant name
        title = restaurants.name
        
        //Self sizing cells
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        showingMapView()
        
    }
    
    func showingMapView() {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurants.location) { (placemarks, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            if let placeMarks = placemarks {
                
                //Getting first placemark
                let placemark = placeMarks[0]
                
                //Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    //Displaying annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    //Changing map type
                    self.mapView.mapType = .standard
                    
                    //Setting zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        }
    }
    
    @objc func showMap() {
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Showing the navigation bar
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //Unwind segue method
    @IBAction func close(segue:UIStoryboardSegue) {
        print("Review view closed")
        
    }
    
    //Unwind segue method
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue) {
        
        if let rating = segue.identifier {
            restaurants.isVisited = true
            
            switch rating {
            case "great":
                restaurants.rating = "Absolutely love it"
            case "good":
                restaurants.rating = "Pretty good"
            case "dislike":
                restaurants.rating = "I don't like it"
            default:
                break
            }
        }
        
        tableView.reloadData()
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
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurants.isVisited) ? "Yes, I've been here. \(restaurants.rating)" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurants
        } else if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurants
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
