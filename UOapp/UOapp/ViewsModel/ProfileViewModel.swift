//
//  ProfileViewModel.swift
//  UOapp
//
//  Created by abdullah on 22/09/1443 AH.
//

import SwiftUI
import Firebase

class ProfileViewModel : ObservableObject{
    
    
    //Modell
    @Published var user: [UserModel] = []
    @Published  var Name = ""
 
    @Published var userInfo = UserModel(ID: "", Name: "", UserImage: "")
    @AppStorage("current_status") var status = false
    
    // Image Picker For Updating Image...
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    // Loading View..
    @Published var isLoading = false
    
    let ref = Firestore.firestore()
   
    
    init() {
        GeUsers()
        Auth.auth().addStateDidChangeListener { auth, user in
            if let id = user?.uid{
            UserApi.GetUser(ID: id) { User in
                self.userInfo = User
               }
            }
        }
      
    }
    
    
    func logOut(){
        
        // logging out..
        
        try! Auth.auth().signOut()
        status = false
    }
    
    func updateImage(){
        
        isLoading = true
        Auth.auth().addStateDidChangeListener { auth, user in
            UploadImage(imageData: self.img_Data, path: "User_Image") { (url) in
            
            self.ref.collection("Users").document(user!.uid).updateData([
            
                "UserImage": url,
            ]) { [self] (err) in
                if err != nil{return}
                
                // Updating View..
                self.isLoading = false
                UserApi.GetUser(ID: user!.uid) { User in
                    self.userInfo = User
                   }
                }
            }
        }
    }
   
    func GeUsers(){
        Auth.auth().addStateDidChangeListener { auth, user in
            if let userid = user?.uid{
                UserApi.GetUser(ID: userid) { User in
                    self.user.append(User)
                   
                }
            }
            
        }
    }
    

}
