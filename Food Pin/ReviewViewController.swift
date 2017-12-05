//
//  ReviewViewController.swift
//  Food Pin
//
//  Created by Vinoth Vino on 05/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurant:Restaurant?
    
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = restaurant {
            restaurantImageView.image = UIImage(named: restaurant.image)
        }
        
        // To blur the background image
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
        
       // containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        //Basic animation
        UIView.animate(withDuration: 0.1) {
            self.containerView.transform = CGAffineTransform.identity
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            
            self.closeButton.transform = CGAffineTransform.identity
            
        }, completion: nil)
        
        //Spring Animation
//        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
//            self.containerView.transform = CGAffineTransform.identity
//        }, completion: nil)
        
//        //Sliding animation
//        UIView.animate(withDuration: 0.3) {
//            self.containerView.transform = CGAffineTransform.init(translationX: 0, y: -1000)
//        }
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
