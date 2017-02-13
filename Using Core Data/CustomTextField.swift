//
//  CustomTextField.swift
//  Using Core Data
//
//  Created by ElderCMA on 13/02/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    @IBInspectable var paddingLeft: CGFloat = 8
    @IBInspectable var paddingRight: CGFloat = 8
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + paddingLeft, y: bounds.origin.y, width: bounds.size.width - paddingLeft - paddingRight, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
