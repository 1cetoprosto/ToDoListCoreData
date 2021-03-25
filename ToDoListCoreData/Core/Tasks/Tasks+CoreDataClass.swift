//
//  Tasks+CoreDataClass.swift
//  ToDoListCoreData
//
//  Created by leomac on 05.03.2021.
//
//

import Foundation
import CoreData
import UIKit

@objc(Tasks)
public class Tasks: NSManagedObject {
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
//    func getContext () -> NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }
    
    private func saveContex(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func addRecords(task: Task) {
        //let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else {return}
        //let taskObject = (NSEntityDescription.insertNewObject(forEntityName: "Tasks", into: context) as! Tasks)
        let taskObject = Tasks(entity: entity, insertInto: context)
        
        taskObject.createdAt = task.createdAt
        taskObject.deathline = task.deathline
        taskObject.important = task.important
        taskObject.isCompleted = task.isCompleted
        taskObject.title = task.title
        taskObject.urgently = task.urgently
        taskObject.taskID = task.taskID
        
        saveContex(context: context)
        
    }
    
    
    func getRecords() -> [Tasks] {
        
        //let context = getContext()
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            let array = try context.fetch(fetchRequest)
            return array
        } catch let error as NSError  {
            print("Could not read \(error), \(error.userInfo)")
        }
        return[]
    }
    
    
    func getRecords(at ID: String? = nil) -> [Tasks] {
        //let context = getContext()
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        if let taskId = ID {
            fetchRequest.predicate = NSPredicate(format: "taskID==%@", taskId as CVarArg)
        }
//        if !(ID == nil) {
//            fetchRequest.predicate = NSPredicate(format: "taskID==%d", ID as CVarArg)
//        }
        
        do {
            let array = try context.fetch(fetchRequest)
            return array
        } catch let error as NSError  {
            print("Could not read \(error), \(error.userInfo)")
        }
        return[]
    }
    
    func getRecords(important: Bool, urgently: Bool) -> [Tasks] {
        //let context = getContext()
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        //if let taskId = ID {
            fetchRequest.predicate = NSPredicate(format: "important==%@ and urgently==%@", important, urgently)
        //}
//        if !(ID == nil) {
//            fetchRequest.predicate = NSPredicate(format: "taskID==%d", ID as CVarArg)
//        }
        
        do {
            let array = try context.fetch(fetchRequest)
            return array
        } catch let error as NSError  {
            print("Could not read \(error), \(error.userInfo)")
        }
        return[]
    }
    
    func deleteRecords(task: Task) {
        //let context = getContext()
        
        let objects =  getRecords(at: task.taskID)
        for object in objects {
            context.delete(object)
        }
        
        saveContex(context: context)
    }
    
    func updateRecords(task: Task) {
        //let context = getContext()
        
        let objects =  getRecords(at: task.taskID)
        for object in objects {
            object.createdAt = task.createdAt
            object.deathline = task.deathline
            object.important = task.important
            object.isCompleted = task.isCompleted
            object.title = task.title
            object.taskID = task.taskID
            object.urgently = task.urgently
        }
        
        saveContex(context: context)
    }
    
    func deleteAllRecords() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Tasks.fetchRequest()
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do { try context.execute(DelAllReqVar)
            saveContex(context: context)
        }
        catch { print(error) }
    }
}




