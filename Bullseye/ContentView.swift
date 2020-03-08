//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam McBride on 3/8/20.
//  Copyright © 2020 Adam McBride Designs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            //Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                let roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(
                    title: Text("Hello there!"),
                    message: Text("The slider's value is \(roundedValue). \n" +
                        "You scored \(self.pointForCurrentRound()) points this round."),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
            
            Spacer()
            
            //Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                
                Spacer()
                
                Text("Score:")
                Text("999999")
                
                Spacer()
                
                Text("Round:")
                Text("999")
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func pointForCurrentRound() -> Int {
        return 999
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
