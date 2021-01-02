//
//  ContentView.swift
//  War Card Game
//
//  Created by Adavize Ozorku on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card3"
    @State private var cpuCard="card4"
    @State private var playerScore:Int = 0;
    @State private var cpuScore:Int = 0
    
    var body: some View {
        ZStack {
            // background
            Image("background").scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // content
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard).cornerRadius(5.0)
                    Spacer()
                    Image(cpuCard).cornerRadius(5.0)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    // generate random number
                    let playerRandomNumber = Int.random(in: 2...14)
                    let cpuRandomNumber = Int.random(in: 2...14)
                    
                    // update card
                    playerCard = "card"+String(playerRandomNumber)
                    cpuCard="card"+String(cpuRandomNumber)
                    
                    // update score based on bigger rand number
                    if (playerRandomNumber > cpuRandomNumber) {
                        return playerScore += 1
                    } else if(cpuRandomNumber > playerRandomNumber) {
                        return cpuScore += 1
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.headline).fontWeight(.bold).foregroundColor(.white)
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(.white).padding(.top, 5.0)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").font(.headline).fontWeight(.bold).foregroundColor(.white)
                        Text(String(cpuScore)).font(.largeTitle).foregroundColor(.white).padding(.top, 5.0)
                    }
                    Spacer()
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
