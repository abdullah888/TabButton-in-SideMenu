//
//  SideView.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

struct SideView: View {
    @Binding var selectedTab: String
    
    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        // Tab View With Tabs...
        TabView(selection: $selectedTab){
            
            // Views...
            Home()
                .tag("الصفحة الرئيسية")
            
            Cart()
                .tag("السلة")
            
            Wishlist()
                .tag("المفضلة")
            
            Settings()
                .tag("الاعدادت")
            
            Add()
                .tag("صفحة الاضافة")
        }
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
