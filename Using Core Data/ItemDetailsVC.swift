//
//  ItemDetailsVC.swift
//  Using Core Data
//
//  Created by ElderCMA on 13/02/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var storePicker: UIPickerView!
    
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores : [Store] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
            
        storePicker.delegate = self;
        storePicker.dataSource = self;
        
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


}
