//
//  CustomCorners.swift
//  UOapp
//
//  Created by abdullah on 21/09/1443 AH.
//

import SwiftUI

// Custom Corner Shapes...
struct CustomCorners: Shape {

    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
