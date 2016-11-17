//
//  NetworkUtils.swift
//  Challenge
//
//  Created by Glauco Moraes on 17/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import UIKit

class NetworkUtils {
    
    func getErrorMessage (statusCode: Int) -> String {
        
        var message: String?
        
        if (statusCode >= 400 && statusCode < 500) {
            message = "Request Error"
        } else if (statusCode >= 500 && statusCode < 600) {
            message = "Service unavailable"
        } else {
            message = "No connection, check and try again"
        }
        return message!
    }
    
}
