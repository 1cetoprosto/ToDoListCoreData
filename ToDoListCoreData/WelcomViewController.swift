//
//  WelcomViewController.swift
//  ToDoListCoreData
//
//  Created by leomac on 18.03.2021.
//

import UIKit
import FirebaseAuth

class WelcomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func exitAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
