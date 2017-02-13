//
//  MainVC.swift
//  Using Core Data
//
//  Created by um tera on 2/12/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        attemptFetch()
        generateFakeData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections  = controller.sections{
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        if let sections  = controller.sections{
            
            return sections.count
        }
        
        return 0;
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        configureCell(cell: cell as! ItemCell, indexPah: indexPath as IndexPath)
        
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPah: IndexPath){
        // update cell
        let item = controller.object(at: indexPah as IndexPath)
        cell.configureCell(newItem: item)
        cell.sizeToFit()
        
    }
    
    func attemptFetch(){
        
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort]
    
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    
        
        self.controller = controller

        do {
            
            try controller.performFetch()
        }
        catch {
            
            let error = error as NSError
            print("\(error)")
        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    
        tableView.endUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {

        case.insert:
            
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        
        case.delete:
            
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break

        case.update:
            
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPah: indexPath)
            }
            break
		
        case.move:
            
            // revoming
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            // adding
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func generateFakeData(){

        if controller.sections?.count.toIntMax() == 0 {
        
            let item = Item(context: context)
            item.title = "MacBook Pro"
            item.price = 1800
            item.details = "it is worth to spend all of this money in a computer"
     
            ad.saveContext()
        }
    }
    
}

