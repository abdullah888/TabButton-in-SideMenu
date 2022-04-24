//
//  MainView.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

struct MainView: View {
    // selected Tab...
    @State var selectedTab = "الصفحة الرئيسية"
    @State var showMenu = false
    
    var body: some View {
       
        ZStack{
            
           
            
            // Side Menu...
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                
                SideMenu(selectedTab: $selectedTab)
            })

            ZStack{
                
                // two background Cards...
                
                Color.black
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    // Shadow...
                    .shadow(color: Color.white.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.black
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    // Shadow...
                    .shadow(color: Color.white.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                Color.black
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    // Shadow...
                    .shadow(color: Color.white.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -75 : 0)
                    .padding(.vertical,90)
                
                SideView(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
                    .disabled(showMenu ? true : false)
            }
            // Scaling And Moving The View...
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
            
                // Menu Button...
                Button(action: {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }, label: {
                    
                    // Animted Drawer Button..
                    VStack(spacing: 5){
                        
                        Capsule()
                            .fill(showMenu ? Color.black : Color.primary)
                            .frame(width: 30, height: 3)
                        // Rotating...
                            .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)

                        VStack(spacing: 5){
                            
                            Capsule()
                                .fill(showMenu ? Color.black : Color.primary)
                                .frame(width: 30, height: 3)
                            // Moving Up when clicked...
                            Capsule()
                                .fill(showMenu ? Color.black : Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                    }
                    .contentShape(Rectangle())
                })
                .padding()
                
                ,alignment: .topLeading
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// Extending View To get Screen Size...
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
