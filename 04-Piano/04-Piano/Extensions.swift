//
//  Extensions.swift
//  04-Piano
//
//  Created by Sergio on 05/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

//Extensiones de variables para hacerlas autoconfigurables en el storyBoard
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else {
                return
            }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
}
