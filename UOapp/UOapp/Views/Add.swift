//
//  Add.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

struct Add: View {
    var body: some View {
        Image(systemName: "plus.rectangle.on.folder.fill")
            .font(.largeTitle)
            .frame(width: 200)
            .foregroundColor(.black)
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
