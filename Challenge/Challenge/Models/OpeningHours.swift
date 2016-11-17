//
//  OpeningHours.swift
//  Challenge
//
//  Created by Glauco Moraes on 16/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import Foundation
import Unbox

class OpeningHours: Unboxable {
    
    // MARK: - Attributes
    
    var openNow: String?
    
    //MARK: - Initialize
    
    required init(unboxer: Unboxer)
    {
        self.openNow = unboxer.unbox(key: "open_now")
    }
}
