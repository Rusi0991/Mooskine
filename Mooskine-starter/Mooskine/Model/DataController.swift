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
    
    init(modelName : String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
}
