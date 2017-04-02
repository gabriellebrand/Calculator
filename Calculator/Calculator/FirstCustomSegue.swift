//
//  FirstCustomSegue.swift
//  Calculator
//
//  Created by Gabrielle Brandenburg dos Anjos on 07/03/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {

    override func perform() {
        // Assign the source and destination views to local variables.
        let firstVCView = self.source.view as UIView!
        let secondVCView = self.destination.view as UIView!

        // Get the screen width and height.
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView?.frame = CGRect(x: 0.0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView!, aboveSubview: firstVCView!)
        
        // Animate the transition.
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            firstVCView?.frame = (firstVCView?.frame.offsetBy(dx: -screenWidth, dy: 0.0))!
            secondVCView?.frame = (secondVCView?.frame.offsetBy(dx: -screenWidth, dy: 0.0))!
            
            }, completion: { (Finished) -> Void in
                self.source.present(self.destination as UIViewController, animated: false, completion: nil)
        }) 
        
    }
}
