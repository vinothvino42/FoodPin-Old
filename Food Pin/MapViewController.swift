//
//  MapViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 06/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var restaurant: Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        // Converting address into coordinates and annotate it on map
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                
                //Getting first placemark
                let placemark = placemarks[0]
                
                //Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    
                    annotation.coordinate = location.coordinate
                    
                    //Displaying annotations
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "pin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        //Reusing annotation
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let iconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        iconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = iconView

        //changing pin color
        annotationView?.pinTintColor = UIColor.blue
        
        return annotationView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
