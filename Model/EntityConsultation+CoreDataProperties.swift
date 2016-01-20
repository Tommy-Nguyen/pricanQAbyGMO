//
//  EntityConsultation+CoreDataProperties.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/20/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EntityConsultation {

    @NSManaged var nickname: String?
    @NSManaged var age: NSNumber?
    @NSManaged var objDescription: String?
    @NSManaged var likeCount: NSNumber?
    @NSManaged var commentCount: NSNumber?
    @NSManaged var watchCount: NSNumber?
    @NSManaged var urlImage: String?

}
