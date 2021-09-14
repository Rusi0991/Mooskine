//
//  DataController.swift
//  Mooskine
//
//  Created by Ruslan Ismayilov on 9/6/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData


class Datacontroller {
    let persistentContainer : NSPersistentContainer
    
    var viewContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName : String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    
    func load(completion : (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            completion?()
        }
    }
}

extension Datacontroller{
    func autoSaveViewContext(interval : TimeInterval = 30){
        print("autosaving")
        guard interval > 0 else {
            print("cannot save the negative interval")
            return
        }
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval : interval)
        }
        
    }
}
