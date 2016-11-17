//
//  APIController.swift
//  Challenge
//
//  Created by Glauco Moraes on 17/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import Foundation
import Alamofire

class APIController {
    
    // MARK: - Attributes
    
    let api = GoogleAPI()
    
    //MARK: - Methods
    
    func getGooglePlaces(lat: Double, lon: Double, completionHandler: @escaping (NSMutableArray?, Int?) -> ()) -> () {
        
        let googleAPIURL = api.getURLGoogleAPI(lat: lat, lon: lon, radius: 5000)
        
        Alamofire.request(googleAPIURL).responseJSON { response in
            
            var statusCode = response.response?.statusCode
            
            if let error = response.result.error as? AFError
            {
                statusCode = error._code
            }
            
            var placesArray: NSMutableArray? = NSMutableArray()
            
            if let JSON = response.result.value
            {
                let placesConverter: PlacesConverter? = PlacesConverter()
                placesArray = placesConverter?.convertModel(json: JSON as! NSDictionary)
            }
            completionHandler(placesArray, statusCode)
        }
    }
    
}
