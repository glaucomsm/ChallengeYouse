//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Glauco Moraes on 16/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import XCTest
@testable import Challenge

class ChallengeTests: XCTestCase {
    
    //MARK: - Attributes
    
     var placesArray = NSMutableArray()
    
    //MARK: - Tests
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let masterDataUrl: NSURL = Bundle.main.url(forResource: "place", withExtension: "json")! as NSURL
        
        let jsonData: NSData = NSData(contentsOf: masterDataUrl as URL)!
        do {
            let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options:  JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            let modelConverter: PlacesConverter = PlacesConverter()
            placesArray = modelConverter.convertModel(json: jsonResult)
        } catch {
            print("json error: \(error)")
        }

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func countPlaces() {
        XCTAssertEqual(placesArray.count, 6)
    }
    
    func testPlace() {
        let places: Places = placesArray[0] as! Places
        XCTAssertEqual(places.name, "The Bay Detail")
        XCTAssertEqual(places.vicinity, "45 3rd St, San Francisco")
        XCTAssertEqual(places.icon, "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png")
    }
    
    func errorAPI() {
        let networkUtils = NetworkUtils()
        
        var message: NSString = networkUtils.getErrorMessage(statusCode:-1009) as NSString
        XCTAssertEqual(message, "No connection, check and try again")
        
        message = networkUtils.getErrorMessage(statusCode:403) as NSString
        XCTAssertEqual(message, "Request Error")
        
        message = networkUtils.getErrorMessage(statusCode:503) as NSString
        XCTAssertEqual(message, "Service unavailable")
    }

    
}
