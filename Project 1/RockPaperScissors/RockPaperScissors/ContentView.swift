//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Manish Harsha Bajracharya on 03/01/2025.
//

import SwiftUI

struct MyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .font(.system(size: 50, weight: .bold))
            .foregroundColor(.white)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 5)
        
    }
}

extension View {
    public func myStyle() -> some View {
        modifier(MyStyle())
    }
}

struct ContentView: View {
    
    let moves: [String] = ["✊🏻", "🖐🏻", "✌🏻"]
    @State private var randomMove = 0
    @State private var appMove = "🖐🏻"   //✊🏻✌🏻🖐🏻
    @State private var playerMove = "✌🏻"
    
    @State private var result: cases = .draw
    
    @State private var printResult: String = ""
    @State private var showingResult: Bool = false
    
    @State private var currentRound: Int = 0
    @State private var currentScore = 0
    @State private var highScore: Int = 0
    
    
    
    enum cases {
        case win
        case lose
        case draw
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack {
                    
                    Spacer()
                    
                    Text("App's move")
                    Text(appMove).myStyle()
                    Spacer()
                    Spacer()
                    
                    Text("Result: \(result)")
                        .foregroundStyle(.red)
                    
                    Spacer()
                    Spacer()
                    
                    Text(playerMove).myStyle()
                    Text("Player's move")
                    
                    Spacer()
                    Spacer()
                    
                    HStack{
                        ForEach(0..<3) { move in
                            Spacer()
                            
                            Button(moves[move]) {
                                moveByApp()
                                moveByPlayer(move)
                                checkWin(move)
                                nextRound()
                            }
                            .padding(5)
                            .font(.largeTitle)
                            .shadow(color: Color.black.opacity(0.5), radius: 15)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                            
                            Spacer()
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 300, maxHeight: 500)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                
                Text("Score: \(currentScore)")
                    .padding(20)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                Text("High Score: \(highScore)")
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(Color.gray)
                    .clipShape(Capsule())
                
                Spacer()
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .ignoresSafeArea()
        .alert("Gave Over.", isPresented: $showingResult) {
            Button("Play again") { resetGame() }
        } message: {
            Text("Your score is \(currentScore)")
        }
    }
    
    
    func moveByApp() {
        randomMove = Int.random(in: 0..<3)
        appMove = moves[randomMove].uppercased()
    }
    
    func moveByPlayer(_ move: Int) {
        playerMove = moves[move].uppercased()
    }
    
    
    func checkWin(_ playerMove: Int) {
        
        let shouldWin = (randomMove + 1) % 3
        let shouldLose = (randomMove + 2) % 3
        
        if playerMove == shouldLose {
            result = .lose
        }
        if playerMove == shouldWin {
            result = .win
            currentScore += 1
        }
        if playerMove == randomMove {
            result = .draw
        }
    }
    
    func nextRound() {
        currentRound += 1
        
        if currentRound == 10 {
            showingResult = true
        }
    }
    
    func resetGame () {
        highScore = currentScore > highScore ? currentScore : highScore
        currentScore = 0
        currentRound = 0
    }
    
}

#Preview {
    ContentView()
}
