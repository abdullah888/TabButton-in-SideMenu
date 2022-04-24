//
//  FloatingHomeCode.swift
//  UOapp
//
//  Created by abdullah on 22/09/1443 AH.
//

import SwiftUI

struct FloatingHomeCode: View {
    @State var selected = 0
    @State var themeColor = Color("blue")
    init() {
            updateNavigationBarColor()
        }

    var body: some View {
    
        ZStack(alignment: .bottom){
          

            VStack{
                
                if self.selected == 0{
                    
                    NavigationView{
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            VStack(spacing: 15){
                                
                                ForEach(1...11,id: \.self){i in
                                    
                                    Image("p\(i)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:UIScreen.main.bounds.width - 30,height: 250)
                                        .cornerRadius(15)
                                }
                                
                            }.padding()
                            .navigationBarTitle("Home",displayMode: .inline)
                            .foregroundColor(.white)
                            
                        }
                        .edgesIgnoringSafeArea(.bottom)
                        .background(Color("blue").edgesIgnoringSafeArea(.all))
                    }
                }
                else if self.selected == 1{
                    
                    GeometryReader{_ in
                        
                        Wishlist()
                    }
                    
                }
                else{
                    
                    GeometryReader{_ in
                        
                        Cart()
                    }
                }
                
            }.background(Color("blue").edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: self.$selected)
        }
    }
    func updateNavigationBarColor() {
           UINavigationBar.appearance().barTintColor = UIColor(themeColor)
           UINavigationBar.appearance().backgroundColor = UIColor(themeColor)
        
       }
}

struct FloatingHomeCode_Previews: PreviewProvider {
    static var previews: some View {
        FloatingHomeCode()
    }
}
