//
//  OneTaskViewController.swift
//  ToDoListCoreData
//
//  Created by leomac on 05.03.2021.
//

import UIKit
//import CoreData

class OneTaskViewController: UIViewController {
    
    //var index:Int = 0
    
    var task: Task!
    
    @IBOutlet weak var taskText: UITextField!
    //@IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var deathLineDatePicker: UIDatePicker!
    @IBOutlet weak var importantLabel: UISegmentedControl!
    @IBOutlet weak var urgentlySegmentControl: UISegmentedControl!
        
    
    @IBAction func pushImportant(_ sender: UISegmentedControl) {
        print("important:\(importantLabel.selectedSegmentIndex)")
    }
    
    @IBAction func pushSaveAction(_ sender: Any) {
        /*
        // save value of task
        task = Task()
        task.createdAt = Date()
        task.title = taskText.text ?? "Empty task"
        task.isCompleted = isCompletedSwitch.isOn
        task.deathline = deathLineDatePicker.date
        task.important = importantLabel.isEnabledForSegment(at: 0)
        task.urgently = urgentlySegmentControl.isEnabledForSegment(at: 0)
        
        let tasks = Tasks()
        tasks.addRecords(task: task)
        //addItem(task: task)
 */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task != nil {
            taskText.text = task.title
            
            isCompletedSwitch.isOn = task.isCompleted
            
            deathLineDatePicker.date = task.deathline
            
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd hh:mm:ss"
            //let createdAt: Date = task.createdAt ?? Date()
//            if task.createdAt == nil {
//                createdAtLabel.text = ""
//            } else {
                createdAtLabel.text = df.string(from: (task.createdAt))
            //}
            
            importantLabel.selectedSegmentIndex = task.important ? 0 : 1
            urgentlySegmentControl.selectedSegmentIndex = task.urgently ? 0 : 1

        } else {
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context = appDelegate.persistentContainer.viewContext
//            task = (NSEntityDescription.insertNewObject(forEntityName: "Tasks", into: context) as! Tasks)
            //toDoItems.append(task)
            //appDelegate.saveContext()
        }
        
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        // save value of task
        task = Task()
        task.title = taskText.text ?? "Empty task"
        task.isCompleted = isCompletedSwitch.isOn
        task.deathline = deathLineDatePicker.date
        task.important = importantLabel.selectedSegmentIndex == 0 ? true:false
        task.urgently = urgentlySegmentControl.selectedSegmentIndex == 0 ? true:false
        
        addItems(task: task)
        
        //TODO: вернуться на предыдущий экран и перезагрузить tableview
        
     }
         
}
