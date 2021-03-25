//
//  SettingsViewController.swift
//  ToDoListCoreData
//
//  Created by leomac on 15.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBAction func pushLoadData(_ sender: Any) {
        
        loadTasksFromCloud()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
