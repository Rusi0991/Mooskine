//
//  Note+Extensions.swift
//  Mooskine
//
//  Created by Ruslan Ismayilov on 9/13/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
    
}
