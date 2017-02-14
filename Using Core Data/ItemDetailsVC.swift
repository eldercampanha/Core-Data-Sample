//
//  ItemDetailsVC.swift
//  Using Core Data
//
//  Created by ElderCMA on 13/02/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var storePicker: UIPickerView!
    
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    //True model data
    var stores : [Store] = []
//    {
//        didSet{
//          storePicker.reloadAllComponents()
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.generateFakeData()

        self.setUpUI()
        self.loadData()
        
        
        storePicker.delegate = self;
        storePicker.dataSource = self;
        
    }
    
    func loadData(){
        
        let fetchRequest : NSFetchRequest<Store> = Store.fetchRequest()

        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        }
        catch {
            
            // handle the error
        }
    }
    
    func setUpUI() {
        
        // remove text from back button
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return stores[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    // columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func generateFakeData(){
        
        if stores.count == 0 {
        
            let storeNamesArray = ["TI & Cia",
                                   "Apple Store",
                                   "Google Store",
                                   "Americanas",
                                   "London Drugs",
                                   "Target"]
            
            for _ in 1...storeNamesArray.count {
                let store = Store(context: context)
                store.name = storeNamesArray[stores.count]
                stores.append(store)
            }
        
        ad.saveContext()
        }
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
     
        let newItem : Item = Item(context: context)
        
        if let title = titleField.text { newItem.title = title }
        if let price = priceField.text { newItem.price = Double(price)! }
        if let details = detailsField.text { newItem.details = details }
        
        newItem.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        // toStore
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
}


