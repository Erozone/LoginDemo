//
//  DesignableTextField.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 29/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage?{
        didSet{
            updateView()
        }
    }
    
    func updateView()  {
        if let image = leftImage{
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            imageView.image = image
            
            leftView = imageView
            
        }else{
            //Image is nil
            leftViewMode = .never
        }
    }
    
}
