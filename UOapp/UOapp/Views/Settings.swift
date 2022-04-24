//
//  Settings.swift
//  UOapp
//
//  Created by abdullah on 22/09/1443 AH.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        Image(systemName: "computermouse.fill")
            .font(.largeTitle)
            .frame(width: 200)
            .foregroundColor(.black)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
