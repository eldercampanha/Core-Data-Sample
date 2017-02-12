//
//  ItemType+CoreDataProperties.swift
//  Using Core Data
//
//  Created by um tera on 2/12/17.
//  Copyright © 2017 um tera. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
