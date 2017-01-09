//
//  DesignableImageView.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 09/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

@IBDesignable class DesignableImageView: UIImageView {

    @IBInspectable var roundCorner : CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = roundCorner
        }
    }

}
