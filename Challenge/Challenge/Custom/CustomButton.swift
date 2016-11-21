//
//  CustomButton.swift
//  Challenge
//
//  Created by Glauco Moraes on 20/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }

}
