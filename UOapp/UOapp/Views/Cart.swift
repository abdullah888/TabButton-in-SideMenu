//
//  Cart.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

struct Cart: View {
    var body: some View {
        Image(systemName: "cart.fill")
            .font(.largeTitle)
            .frame(width: 200)
            .foregroundColor(.black)
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
