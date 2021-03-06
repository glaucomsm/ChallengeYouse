//
//  GoogleAPI.swift
//  Challenge
//
//  Created by Glauco Moraes on 16/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import Foundation

struct GoogleAPI {
    
    static let baseURLString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    static let apiKey = "AIzaSyAKd1IlCzCkI85rtPu-r4onhHbozsV0DNE"
    
    func getURLGoogleAPI(lat: Double, lon: Double, radius: Int) -> String {
        return GoogleAPI.baseURLString + "?location=\(lat),\(lon)&radius=\(radius)&types=car_repair&key=" + GoogleAPI.apiKey
    }
    
}
