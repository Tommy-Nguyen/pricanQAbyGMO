//
//  DataManager.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/20/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    class var sharedManager: DataManager {
        struct Singleton {
            static var once_token: dispatch_once_t = 0
            static var sharedClient: DataManager? = nil
        }
        
        dispatch_once(&Singleton.once_token) { () -> Void in
            Singleton.sharedClient = DataManager()
        }
        return Singleton.sharedClient!
    }
    
    // MARK: - Core Data Method
    
    func clearAllDataLocal(entityName: String) {
        let context = (UIApplication .sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: entityName)
        
        do {
            let results = try context.executeFetchRequest(request)
            for managedObject in results {
                let managerObjectData: NSManagedObject = managedObject as! NSManagedObject
                context.deleteObject(managerObjectData)
            }
        }
        catch let error as NSError {
            print("Detele all data in \(entityName) error : \(error) \(error.userInfo)")
        }
    }
    
    func saveDaTaToLocal(list : NSMutableArray) {
        let managedObjectContext = (UIApplication .sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        for var i = 0 ; i < list.count ; i++ {
            let obj = list .objectAtIndex(i) as! Consultation
            let entityConsultation = NSEntityDescription.insertNewObjectForEntityForName("EntityConsultation", inManagedObjectContext:managedObjectContext) as! EntityConsultation
            
            entityConsultation.age = NSNumber(integer: obj.age)
            
            entityConsultation.nickname = obj.nickname
            entityConsultation.objDescription = obj.objDes
            entityConsultation.urlImage = obj.urlImage
            
            entityConsultation.likeCount = NSNumber(integer: obj.like_count)
            entityConsultation.watchCount = NSNumber(integer: obj.watch_count)
            entityConsultation.commentCount = NSNumber(integer: obj.comment_count)
            
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func getAllConsultationRecordFromLocal(entityName: String) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: entityName)
        
        var result = [EntityConsultation]?()
        
        do {
            try result = context.executeFetchRequest(request) as? [EntityConsultation]
        }
        catch {
            fatalError("Failure to get all context: \(error)")
        }
        
        if let array = result {
            for currentConslutation in array as [EntityConsultation] {
                DLog("\(currentConslutation)")
            }
        }
    }
}

