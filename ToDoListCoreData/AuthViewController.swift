//
//  AuthViewController.swift
//  ToDoListCoreData
//
//  Created by leomac on 17.03.2021.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController, UITabBarControllerDelegate, UITextFieldDelegate {
    
    var signup: Bool = true {
        willSet{
            if newValue {
                titleLabel.text = "Registration"
                nameField.isHidden = false
                enterButton.setTitle("Login", for: .normal)
                haveAccountLabel.text = "You have an accaunt?"
            } else {
                titleLabel.text = "Login"
                nameField.isHidden = true
                enterButton.setTitle("Registration", for: .normal)
                haveAccountLabel.text = "You do not have an accaunt?"
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var haveAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        signup = false
    }
    
    @IBAction func switchLogin(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please fill in all fields!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signAction(_ sender: Any) {
        
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if signup {
            if (!name.isEmpty && !email.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        //print("Created user with UID: \(result!.user.uid)")
                        FIRFirestoreService.shared.addUpdateDocument(collection: "users",
                                                                     idDocement: result!.user.uid,
                                                                     data: ["name":name, "email":email])
                        
                    }
                }
            } else {
                showAlert()
            }
        } else {
            if (email.isEmpty && password.isEmpty) {
                showAlert()
                return
            }
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard error == nil else { return self.displayError(error) }
            }
            self.transitionToTabBarViewController()
        }
    }
    
    private func transitionToTabBarViewController() {
        guard let TabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {return}
        self.view.window?.rootViewController = TabBarController
        self.view.window?.makeKeyAndVisible()
    }
    
}


