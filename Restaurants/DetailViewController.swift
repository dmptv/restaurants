//
//  DetailViewController.swift
//  Restaurants
//
//  Created by Kanat A on 06/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var restaurantImage = ""
    var name = ""
    var location = ""
    var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImage)
        nameLabel.text = name
        locationLabel.text = location
        typeLabel.text = type
        
    }

 



}
