//
//  MaterialView.swift
//  Using Core Data
//
//  Created by um tera on 2/12/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    @IBInspectable var materialDesign : Bool {
     
        get {
            return materialKey
        }
        
        set {
            
            guard materialKey == newValue, materialDesign == true else {

                self.layer.shadowOpacity = 0.8
                self.layer.cornerRadius = 3.0
                self.layer.shadowColor = nil
                
                return                
            }

            self.layer.masksToBounds = false
            self.layer.cornerRadius = 3.0
            self.layer.shadowOpacity = 0.8
            self.layer.cornerRadius = 3.0
            self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.layer.shadowColor = UIColor.red.cgColor

        }
        
    }
}
