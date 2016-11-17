//
//  PlacesConverter.swift
//  Challenge
//
//  Created by Glauco Moraes on 17/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import Foundation
import Unbox

class PlacesConverter {
    
    //MARK: - Methods
    
    func convertModel(json: NSDictionary) -> NSMutableArray {
        
        let placesArray: NSMutableArray? = NSMutableArray()
        let jsonResults: NSArray
        jsonResults = json["results"] as! NSArray
        
        for jsonPlaces in jsonResults
        {
            do {
                let places: Places = try unbox(dictionary: jsonPlaces as! UnboxableDictionary)
                placesArray!.add(places)
            }
            catch {
            }
        }
        return placesArray!
    }
}
