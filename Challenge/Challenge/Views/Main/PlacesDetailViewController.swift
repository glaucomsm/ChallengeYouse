//
//  PlacesDetailViewController.swift
//  Challenge
//
//  Created by Glauco Moraes on 18/11/16.
//  Copyright © 2016 Youse. All rights reserved.
//

import UIKit
import Social
import Accounts

class PlacesDetailViewController: UIViewController {
    
    
    //MARK: - Attributes
    
    var places: Places?
    
    //MARK: - IBOutlet
    
    @IBOutlet var placesImage: UIImageView!
    
    @IBOutlet var placesName: UILabel!
    @IBOutlet var placesVicinity: UILabel!
    
    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = places?.name
        
        loadPlaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    
    func loadPlaces() {
        
        self.placesName.text = places?.name
        self.placesVicinity.text = places?.vicinity
        let imageURL = URL(string: (places?.icon)!)
        self.placesImage.kf.setImage(with: imageURL)
    }
    
    //MARK: - IBAction
    
    @IBAction func facebook(_ sender: CustomButton) {
        
        let image: UIImage = UIImage(named: "logo.png")!
        
        let fbController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fbController?.setInitialText("")
        fbController?.add(image)
        
        let completionHandler = {(result:SLComposeViewControllerResult) -> () in
            fbController?.dismiss(animated: true, completion:nil)
            switch(result){
            case SLComposeViewControllerResult.cancelled:
                print("User canceled", terminator: "")
            case SLComposeViewControllerResult.done:
                print("User posted", terminator: "")
            }
        }
        
        fbController?.completionHandler = completionHandler
        self.present(fbController!, animated: true, completion:nil)
    }
    
}
