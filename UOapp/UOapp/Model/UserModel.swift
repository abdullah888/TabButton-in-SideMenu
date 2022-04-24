//
//  UserModel.swift
//  UOapp
//
//  Created by abdullah on 22/09/1443 AH.
//

import SwiftUI
import Foundation
import Firebase

class UserModel :Identifiable {
    
    var ID : String?
    var Name : String?
    var UserImage : String?
    
    init(ID : String ,  Name : String, UserImage : String) {
        self.ID = ID
        self.Name = Name
        self.UserImage = UserImage
      
    }
    
    init(Dictionary : [String : AnyObject]) {
        self.ID = Dictionary["ID"] as? String
        self.Name = Dictionary["Name"] as? String
        self.UserImage = Dictionary["UserImage"] as? String
    }
    
    func MakeDictionary()->[String : AnyObject] {
        var New : [String : AnyObject] = [:]
        New["ID"] = self.ID as AnyObject
        New["Name"] = self.Name as AnyObject
        New["UserImage"] = self.UserImage as AnyObject
        return New
    }
    
    func Upload(){
        guard let id = self.ID else { return }
        Firestore.firestore().collection("Users").document(id).setData(MakeDictionary())
    }
    
//    func Remove(){
//        guard let id = self.ID else { return }
//        Firestore.firestore().collection("Users").document(id).delete()
//    }
    
    
    
    
}


class UserApi {
    
    
    static func GetUser(ID : String, completion : @escaping (_ User : UserModel)->()){
        
        Firestore.firestore().collection("Users").document(ID).addSnapshotListener { (Snapshot : DocumentSnapshot?, Error : Error?) in
            
            if let data = Snapshot?.data() as [String : AnyObject]? {
               let New = UserModel(Dictionary: data)
                completion(New)
            }
            
        }
        
    }
    
    static func GetAllUsers(completion : @escaping (_ User : UserModel)->()){
        Firestore.firestore().collection("Users").getDocuments { (Snapshot, error) in
            if error != nil { print("Error") ; return }
            guard let documents = Snapshot?.documents else { return }
            for P in documents {
                if let data = P.data() as [String : AnyObject]? {
                    let New = UserModel(Dictionary: data)
                    completion(New)
                }
            }
        }

    }

    
    
}
