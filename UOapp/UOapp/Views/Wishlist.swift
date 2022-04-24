//
//  Wishlist.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

struct Wishlist: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.largeTitle)
            .frame(width: 200)
            .foregroundColor(.black)
    }
}

struct Wishlist_Previews: PreviewProvider {
    static var previews: some View {
        Wishlist()
    }
}
