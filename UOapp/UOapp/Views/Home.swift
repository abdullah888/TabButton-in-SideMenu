//
//  Home.swift
//  UOapp
//
//  Created by abdullah on 20/09/1443 AH.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
    
        Image(systemName: "house.fill")
            .font(.largeTitle)
            .frame(width: 200)
            .foregroundColor(.black)
    }
   
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


