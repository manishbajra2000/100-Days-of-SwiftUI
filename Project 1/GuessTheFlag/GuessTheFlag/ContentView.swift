//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manish Harsha Bajracharya on 27/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var endGame = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var highScore = 0
    
    @State private var currentQuestionNumber = 0
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.2 ), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Spacer()
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity )
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text("High Score: \(highScore)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack {
                    Button("New Game", action: newGame)
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(.white)
                    Spacer()
                    Button("Reset", action: resetGame)
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(.white)
                }
                .padding(.bottom, -20)
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)")
        }
        .alert("The End", isPresented: $endGame) {
            Button("New game", action: newGame)
        } message: {
            if (currentScore > highScore) {
                Text(
                    """
                    New high score!
                    Your final score is \(currentScore) out of 8
                    """
                )
            }
        }
    }
    
    
    // Logic Starts
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func newGame() {
        if (currentScore > highScore) {
            highScore = currentScore
        }
        askQuestion()
        currentQuestionNumber = 0
        currentScore = 0
    }
    
    
    func flagTapped(_ number: Int){
        if currentQuestionNumber != 7 {
            checkAnswer(number)
            currentQuestionNumber += 1
            showingScore = true
        } else {
            checkAnswer(number)
            endGame = true
            
        }
            
    }
    
    func checkAnswer(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            currentScore += 1
        } else {
            scoreTitle =    """
                            Wrong! 
                            That's the flag of \(countries[number])
                            """
        }
    }
    
    func resetGame() {
        newGame()
        highScore = 0
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}
