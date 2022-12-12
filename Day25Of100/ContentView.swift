//
//  ContentView.swift
//  Day25Of100
//
//  Created by Anand Narayan on 2022-12-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerChoice=0
    @State var appChoice=0
    @State var results = ""
    var moves = ["Rock", "Paper", "Scissors"]
    @State var playerScore = 0
    @State var appScore = 0
    //var appMove: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(playerScore)")
                Text("Score")
                Text("\(appScore)")
            }
            HStack {
                Text("Player 1")
                Text("vs.")
                Text("App")
            }
            HStack {
                // Player Section
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                    Text("\(moves[playerChoice])")
                        
                    }
                   
               

                Button(action: {
                    appChoice = Int.random(in: 0...2)
                    playerChoice = Int.random(in: 0...2)
                    if ( (appChoice == 0 || appChoice == 2) && (playerChoice == 0 || playerChoice == 2) ) {
                        results = determineRockAndScissors(app: appChoice, player: playerChoice)
                    } else {
                        results = determineOthers(app: appChoice, player: playerChoice)
                    }
                    
                }, label: {
                    Text("Play")
                })
                //App Section
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)

                    Text("\(moves[appChoice])")


                }
            }
            Text("\(results)")

            }
            

        }
    
    
    func determineRockAndScissors(app: Int, player: Int) -> String{
        if (app == player) {
            return "Tie"
        }
        if (app < player) {
            appScore += 1
            return "App Wins"
        }
        playerScore += 1
        return "Player Wins"
            
    }

    func determineOthers(app: Int, player: Int) -> String {
        if (app == player) {
            return "Tie"
        }
        if (app > player) {
            appScore += 1
            return "App Wins"
        }
        playerScore += 1
        return "Player Wins"
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
