//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam McBride on 3/8/20.
//  Copyright © 2020 Adam McBride Designs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random( in: 1...100 )
    @State var score = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            
            Spacer()
            
            // Slider row
            HStack {
                
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                
            }
            
            Spacer()
            
            //Button row
            Button(action: {
                
                self.alertIsVisible = true
                self.score = self.score + self.pointsForCurrentRound()
                
            }) {
                
                Text("Hit Me!")
                
            }
            .alert(isPresented: $alertIsVisible) { () ->
                
                Alert in
                
                return Alert(
                    
                    title: Text("Hello there!"),
                    message: Text("The slider's value is \(sliderValueRounded()). \n" +
                        "You scored \(pointsForCurrentRound()) points this round."),
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
                Text("\(score)")
                
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
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        return 100 - abs(target - sliderValueRounded())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
