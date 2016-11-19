//
//  PlacesTableViewController.swift
//  Challenge
//
//  Created by Glauco Moraes on 17/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import UIKit
import CoreLocation
import Kingfisher
import SVProgressHUD

class PlacesTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    //MARK: - Attributes
    
    var placesArray: NSMutableArray?
    let manager = CLLocationManager()
    
    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placesArray = NSMutableArray()
        self.getLocation()
        self.title = "Places"
        
        // Empty back button title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(PlacesTableViewController.reloadPlaces), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refreshControl!)
        
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    
    func reloadPlaces() {
        self.refreshControl?.endRefreshing()
        self.placesArray?.removeAllObjects()
        self.tableView?.reloadData()
        self.getLocation()
    }
    
    func getLocation() {
        self.manager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            SVProgressHUD.show(withStatus: "Loading Places")
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
    }
    
    func loadPlaces(lat: Double, lon: Double) {
        let googleAPIController = APIController()
        googleAPIController.getGooglePlaces(lat: lat, lon: lon) { (placesArray, statusCode) in
            if statusCode == 200 {
                SVProgressHUD.showSuccess(withStatus: "Places Loaded")
                self.placesArray = placesArray
                self.tableView.reloadData()
            } else {
                let errorHelper = NetworkUtils()
                SVProgressHUD.showError(withStatus: errorHelper.getErrorMessage(statusCode: statusCode!))
            }
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate: CLLocationCoordinate2D = manager.location!.coordinate
        self.loadPlaces(lat: coordinate.latitude, lon: coordinate.longitude)
        manager.stopUpdatingLocation()
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.placesArray?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath) as! PlacesTableViewCell
        
        if let place = self.placesArray?[indexPath.row] as? Places {
            cell.placesNames.text = place.name
            cell.placesVicinity.text = place.vicinity
            let imageURL = URL(string: (place.icon)!)
            cell.placesImage.kf.setImage(with: imageURL)
        }
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlacesDetailViewController") as! PlacesDetailViewController
        vc.places = self.placesArray?[indexPath.row] as? Places
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
