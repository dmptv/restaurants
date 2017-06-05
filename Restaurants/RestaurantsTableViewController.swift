//
//  RestaurantsTableViewController.swift
//  Restaurants
//
//  Created by Kanat A on 05/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    
    var restaurantsNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantTypes = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantsIsVisited = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel?.text = restaurantsNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        cell.thumbnailImageView.layer.cornerRadius = 10.0
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.accessoryType = restaurantsIsVisited[indexPath.row] ? .checkmark : .none
     
      
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let optMenu = UIAlertController(title: nil, message: "What you want to do", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        let isVisitedTitle = restaurantsIsVisited[indexPath.row] ? "Я тут не был" : "Я тут был"
        
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .default) { (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
             self.restaurantsIsVisited[indexPath.row] = self.restaurantsIsVisited[indexPath.row] ? false : true
             cell?.accessoryType = self.restaurantsIsVisited[indexPath.row] ? .checkmark : .none
        }
        
        let callActionHandler = {(action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service is not available", message: "Ssory you can not call right now, repeate it later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call" + "123-000\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optMenu.addAction(cancelAction)
        optMenu.addAction(callAction)
        optMenu.addAction(isVisitedAction)
        
        self.present(optMenu, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
    }
    



}

























