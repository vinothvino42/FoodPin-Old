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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // To blur the background image
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        
        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
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
