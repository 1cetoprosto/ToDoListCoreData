//
//  Tasks+CoreDataProperties.swift
//  ToDoListCoreData
//
//  Created by leomac on 05.03.2021.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var urgently: Bool
    @NSManaged public var important: Bool
    @NSManaged public var deathline: Date?
    @NSManaged public var user: User?
    @NSManaged public var taskID: String?

}

extension Tasks : Identifiable {

}
