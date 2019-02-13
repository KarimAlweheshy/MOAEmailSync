//
//  DataProvider.swift
//  Email
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation
import CoreData

final class DataProvider {
    let mainContext: NSManagedObjectContext
    let backgroundContext: NSManagedObjectContext
    
    fileprivate let persistanceContainer: NSPersistentContainer
    
    init() {
        persistanceContainer = EmailPersistanceContainer(name: "Email")
        persistanceContainer.loadPersistentStores { (_, error) in print(String(describing: error)) }
        mainContext = persistanceContainer.viewContext
        backgroundContext = persistanceContainer.newBackgroundContext()
    }
}
