//
//  AboutView.swift
//  Bullseye
//
//  Created by Adam McBride on 3/8/20.
//  Copyright © 2020 Adam McBride Designs. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 225.0 / 255.0, green: 214.0 / 255, blue: 179.0 / 255.0)
    
    var body: some View {
        
        Group {
            
            VStack {
                
                Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by draggin a slider.").modifier(AbouBodyStyle())
                Text("Your goal is to place the slider as close to as possible to the target value. The closer you get, the more points you score.").modifier(AbouBodyStyle())
                Text("Enjoy!").modifier(AbouBodyStyle())
                
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
            
        }
        .background(Image ("Background"))
    }
}

struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .padding(.vertical, 30.0)
        
    }
}

struct AbouBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .padding(.bottom, 20.0)
            .padding(/*@START_MENU_TOKEN@*/.horizontal, 60.0/*@END_MENU_TOKEN@*/)
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        
        AboutView().previewLayout(.fixed(width: 896, height: 414))
        
    }
}
