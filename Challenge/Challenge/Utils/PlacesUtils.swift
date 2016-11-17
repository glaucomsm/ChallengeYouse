//
//  PlacesUtils.swift
//  Challenge
//
//  Created by Glauco Moraes on 17/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import UIKit

class PlacesUtils {

    func getOpenNowString(openNow: String) -> String {
        return (openNow == "0") ? "Fechado" : "Aberto"
    }

    func getOpenNowColor(openNow: String) -> UIColor {
    return (openNow == "0") ? UIColor.red : UIColor.green
    }

}
