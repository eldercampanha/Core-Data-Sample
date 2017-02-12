//
//  Item+CoreDataClass.swift
//  Using Core Data
//
//  Created by um tera on 2/12/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        // updating timestamp	
        self.created = Date() as NSDate?
        
    }
}
