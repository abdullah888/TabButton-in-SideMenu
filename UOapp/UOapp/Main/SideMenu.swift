//
//  SideMenu.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct SideMenu: View {
    @StateObject var profileDate = ProfileViewModel()
    @Binding var selectedTab: String
    @Namespace var animation
    @State var Show = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            if profileDate.userInfo.UserImage == nil{
            // Profile Pic...
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            // Padding top for Top Close Button...
                .padding(.top,50)
            } else {
                WebImage(url: URL(string: profileDate.userInfo.UserImage!))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                // Padding top for Top Close Button...
                    .padding(.top,50)
            }
            
            VStack(alignment: .leading, spacing: 6, content: {
                if profileDate.userInfo.Name == nil{
                Text("اسم المستخدم")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                } else{
                    Text(profileDate.userInfo.Name!)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                
                Button(action: {
                    Show = true
                }, label: {
                    HStack{
                    Text("تحرير البيانات")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .opacity(0.7)
                        
                        Image(systemName: "pencil")
                            .font(.title)
                            .foregroundColor(.black)
                            .opacity(0.7)
                    }
                })
            })
            
            // tab Buttons...
            VStack(alignment: .leading,spacing: 10){
                
                TabButton(image: "house.fill", title: "الصفحة الرئيسية", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "cart.fill", title: "السلة", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "heart.fill", title: "المفضلة", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "computermouse.fill", title: "الاعدادت", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "plus.rectangle.on.folder.fill", title: "صفحة الاضافة", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading,-15)
            .padding(.top,50)
            
            Spacer()
            
            // Sign Out Button...
            VStack(alignment: .leading, spacing: 6, content: {
                
                Button {
                    
                } label: {
                    HStack{
                    Image(systemName: "envelope.fill")
                        .font(.title)
                        .frame(width: 20)
                        .foregroundColor(.black)
                       
                        
                        Text("الاتصال بنا")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                    }
                        
                }
                .padding()
                .padding(.leading,-15)

                Text("النسخة الاولى")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .opacity(0.6)
            })
            
        })
        .sheet(isPresented: $Show, content: {
            AddProfile()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
