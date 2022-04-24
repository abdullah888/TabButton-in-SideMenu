//
//  AddProfile.swift
//  UOapp
//
//  Created by abdullah on 22/09/1443 AH.
//

import SwiftUI
import Firebase

struct AddProfile: View {
    @Environment(\.presentationMode) var presentationMode
    @State var color = Color.black.opacity(0.7)
    @State var name = ""
    @State var alert = false
    @State var error = ""
    @State var img_Data = Data.init(count: 0)
    @State var shown = false
    var body: some View {
        VStack{
            VStack {
                if img_Data.count != 0 {
                    Image(uiImage: UIImage(data: img_Data)!)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 200, height: 200)
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 2)
                    } else {
                        VStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 2)
                                .padding(.bottom, 1)
                            HStack{
                            Text("اختيار صورة من الاستوديو")
                                .font(.headline)
                                .foregroundColor(.black)
                                
                                Image(systemName: "plus.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                    }
                }
                
            } // VStack
            .onTapGesture(perform: {
                self.shown.toggle()
            })
            .padding(.top, 10)
            
            VStack{
            TextField("الاسم", text: self.$name)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.name != "" ? Color("Color") : self.color, lineWidth: 2))
                .frame(width: UIScreen.main.bounds.width - 30)
                .padding(.top, 25)
            
            Button(action: {
                
                addUser()
                
            }) {
                Text("تسجيل")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(.black)
            .cornerRadius(8)
            .padding(.top, 25)
            }
        }.sheet(isPresented: $shown) {
            ImagePicker(picker: self.$shown, img_Data: self.$img_Data)
        }.animation(.spring(),value: shown)
    }
    func AddUser(){
        let uid = Auth.auth().currentUser?.uid
        UploadImage(imageData: img_Data, path: "User_Image") { url in
            UserModel(ID: uid!, Name: name, UserImage: url).Upload()
        }
        presentationMode.wrappedValue.dismiss()
    }
    
    func addUser(){
       
        Auth.auth().signInAnonymously { (res, err) in
            
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            print("Success = \(res!.user.uid)")
            
            UploadImage(imageData: img_Data, path: "User_Image") { url in
                UserModel(ID: res!.user.uid, Name: name, UserImage: url).Upload()
            }
            presentationMode.wrappedValue.dismiss()
            
        }
    }
    
}

