//
//  RestaurantsTableViewController.swift
//  Restaurants
//
//  Created by Kanat A on 05/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    

    var restaurants: [Restaurant] = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong",
                                                image: "cafedeadend.jpg", isVisited: false),
                                     Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
                                     Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
                                     Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
                                     Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
                                     Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
                                     Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
                                     Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false), Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
                                     Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
                                     Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
                                     Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
                                     Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
                                     Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
                                     Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
                                     Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
                                     Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
                                     Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
                                     Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
                                     Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
                                     Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false)]

    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        // из массива имен берем имя картинки
        cell.thumbnailImageView?.image = UIImage(named: restaurants[indexPath.row].image)
        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.locationLabel?.text = restaurants[indexPath.row].location
        cell.typeLabel?.text = restaurants[indexPath.row].type
        
        cell.thumbnailImageView.layer.cornerRadius = 10.0
        cell.thumbnailImageView.clipsToBounds = true
        
        // првоеряем ставить или нет чекмарк
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
     
        return cell
    }
    
    // покажем алерт вью с action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // алерт Sheet и мессаж
        let optMenu = UIAlertController(title: nil, message: "What you want to do", preferredStyle: .actionSheet)
        // Action  - cancel
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        // title из-ся в зависимости от - ставим или убираем чекмарк
        let isVisitedTitle = restaurants[indexPath.row].isVisited ? "Я тут не был" : "Я тут был"
    
        // create Action - is Visited
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .default) { (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
            // изменяем false : true
            self.restaurants[indexPath.row].isVisited = self.restaurants[indexPath.row].isVisited ? false : true
            // ставим чекмарк
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        }
        
        //  клоужер как объект - с  Alert и Action
        let callActionHandler = {(action: UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Service is not available", message: "Ssory you can not call right now, repeate it later", preferredStyle: .alert)
            
            // Action с кнопкой  - OK
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        // Action с вложенным в клоужер алерт и акшн
        let callAction = UIAlertAction(title: "Call" + "123-000\(indexPath.row)", style: .default, handler: callActionHandler)
        
        // 3 Actions в Алерте
        optMenu.addAction(cancelAction)
        optMenu.addAction(callAction)
        optMenu.addAction(isVisitedAction)
     
        // покажем Aлерт
        self.present(optMenu, animated: true, completion: nil)
    }
    

    // сделаем кастомную выезжающую кнопку - Share and Delete
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // создаем кнопк - Social sharing (copy)
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            // текст который будет скопирован при нажати на - Copy
            let defaultText = "Just checking in at" + self.restaurants[indexPath.row].name
            
            // добавим Action  в  Activity Controller
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        // кнопкa Delete row
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            // удаляем данные из дата соурсе
            self.restaurants.remove(at: indexPath.row)
           
            // удаляем ряд из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor(red: 28/255, green: 165/255, blue: 253/255, alpha: 1)
        deleteAction.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 203/255, alpha: 1)
        
        // регулируем порядок кнопок
        return [deleteAction, shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.restaurantImage = restaurants[indexPath.row].image
                destinationController.name = restaurants[indexPath.row].name
                destinationController.location = restaurants[indexPath.row].location
                destinationController.type = restaurants[indexPath.row].type
            }
        }
    }
    
    
}
































