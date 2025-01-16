//
//  ContentView.swift
//  Edutainment
//
//  Created by Manish Harsha Bajracharya on 15/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tableOf: Int = 2
    @State private var quesNumberList = [5, 10, 20]
    @State private var noOfQues: Int = 5
    @State private var answersOfTheTable: [Int] = []
    
    @State private var questionIndex = 0
    
    @State private var currentQuesNumber = 0
    @State private var currentScore = 0
    
    @State private var answer = ""
    
    @State private var showingScore = false
    @State private var answerMessage = ""
    @State private var showEndGameAlert: Bool = false
    
    @State private var showingQuestions = false
    @State private var showingSettings = true
    
    
    var body: some View {
//        Button("Settings") {
//            showingSettings.toggle()
//            if showingQuestions{
//                showingQuestions = false
//            }
//        }
        if showingSettings{
            VStack{
                Form {
                    Section("Pick a multiplication table:") {
                        Stepper("\(tableOf) Tables", value: $tableOf, in: 2...12, step: 1)
                    }
                    
                    Section("How many questions do you want?") {
                        Picker("How many questions do you want?", selection: $noOfQues) {
                            ForEach(quesNumberList, id: \.self) {                         Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section{
                        Button("Generate Questions") {
                            startGame()
                        }
                        .padding(10)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                    }
                }
            }
        }
        
        
        if showingQuestions {
            VStack {
                Form {
                    Section {
                        Text("\(tableOf) x \(answersOfTheTable[questionIndex] / tableOf) = ?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        TextField("Answer", text: $answer)
                            .keyboardType(.numberPad)
                    }
                }
                .onSubmit {
                    checkAnswer()
                }
                .alert(answerMessage, isPresented: $showingScore){
                    Button("Ask next", action: askQuestion)
                }
                .alert(answerMessage, isPresented: $showEndGameAlert){
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        Spacer()
        
        Text("Score: \(currentScore)")
            .font(.title)
            .fontWeight(.bold)
        
        Spacer()
        
        
        
        
        
    }
    
    
    
    func startGame() {
        
        answersOfTheTable.removeAll()
        for i in 1...10 {
            answersOfTheTable.append(tableOf * i)
        }
        answersOfTheTable.shuffle()
        print(answersOfTheTable)
        showingQuestions = true
    }
    
    func askQuestion() {
        
        currentQuesNumber += 1
        questionIndex = currentQuesNumber % 10
        
        
//        if currentQuesNumber < (noOfQues - 1) {
//            currentQuesNumber += 1 
//            questionIndex = currentQuesNumber % 10
//        }
//        else {
//            endGame()
//        }
    }
    
    func checkAnswer() {
        if Int(answer.trimmingCharacters(in: .whitespacesAndNewlines)) == answersOfTheTable[questionIndex] {
            answerMessage = "Correct"
            currentScore += 1
        }
        else {
            answerMessage = "Incorrect"
        }
        showingScore = true
    }
    
    func endGame() {
        currentQuesNumber = 0
        questionIndex = 0
        answerMessage = "End of the Game."
        showingQuestions = false
        showEndGameAlert = true
    }
    

    
}



#Preview {
    ContentView()
}
