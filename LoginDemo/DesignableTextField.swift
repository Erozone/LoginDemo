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
    
    @IBInspectable var leftPadding: CGFloat = 0{
        didSet{
            updateView()
        }
    }
    
    func updateView()  {
        if let image = leftImage{
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 40, height: 40))
            imageView.image = image
            
            let width = leftPadding + 20
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
            view.addSubview(imageView)
            
            leftView = imageView
            
        }else{
            //Image is nil
            leftViewMode = .never
        }
    }
    
}
