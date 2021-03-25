//
//  FIRFirestoreService.swift
//  ToDoListCoreData
//
//  Created by leomac on 15.03.2021.
//

import Foundation
import Firebase

class FIRFirestoreService {
    
    private init() {}
    static let shared = FIRFirestoreService()
    
    func configure() {
        FirebaseApp.configure()
    }
    
    let db = Firestore.firestore()
    
    func addUpdateDocument(collection: String, idDocement: String, data: [String:Any]) {
        
        db.collection(collection).document(idDocement).setData(data) { err in
            if let err = err {
                print("Error writing document: \(err.localizedDescription)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func deleteDocument(task: Task) {
        
        db.collection("task").document(task.taskID).delete() { err in
            if let err = err {
                print("Error removing document: \(err.localizedDescription)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    //func loadDocuments(_ collectionPath:String) -> [[String:Any]] {
    //
    //    var collection = [[String:Any]]()
    //
    //    db.collection(collectionPath).getDocuments() { (querySnapshot, err) in
    //        if let err = err {
    //            print("Error getting documents: \(err)")
    //        } else {
    //            for document in querySnapshot!.documents {
    //                //print("\(document.documentID) => \(document.data())")
    //                collection.append(document.data())
    //            }
    //        }
    //    }
    //    return collection
    //}
}
