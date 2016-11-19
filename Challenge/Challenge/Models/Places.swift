//
//  Places.swift
//  Challenge
//
//  Created by Glauco Moraes on 16/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import Foundation
import Unbox

class Places: Unboxable {
    
    // MARK: - Attributes
    
    var name: String?
    var openingHours: OpeningHours?
    var icon: String?
    var vicinity: String?
    
    //MARK: - Initialize
    
    required init(unboxer: Unboxer) {
        self.name = unboxer.unbox(key: "name")
        self.openingHours = unboxer.unbox(key: "opening_hours")
        self.icon = unboxer.unbox(key: "icon")
        self.vicinity = unboxer.unbox(key: "vicinity")
    }
    
}
