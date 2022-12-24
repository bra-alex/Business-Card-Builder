//
//  DataController.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 23/12/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "BusinessCardBuilderModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
