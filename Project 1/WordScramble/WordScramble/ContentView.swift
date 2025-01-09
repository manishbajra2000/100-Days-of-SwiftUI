//
//  ContentView.swift
//  WordScramble
//
//  Created by Manish Harsha Bajracharya on 06/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords: [String] = []
    @State private var newWord: String = ""
    @State private var rootWord: String = ""
    
    @State private var score: Int = 0
    @State private var highScore: Int = 0

    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showError) {
                    Button("OK") { }
                } message: {
                    Text(errorMessage)
                }
                .toolbar{
                    Button("New Word") { startGame() }
                }
                
                HStack{
                    Text("Score: \(score)")
                    Spacer()
                    Text("High Score: \(highScore)")
                }
                .padding(.horizontal)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already used", message: "You thought you were clever, didn't you.")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "Please enter a word that can be made from \(rootWord.uppercased()).")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not real", message: "You cannot just make them up, you know!")
            return
        }
        
        guard isNotTheSame(word: answer) else {
            wordError(title: "Word same as rootword", message: "Big brain, you can't use the same word.")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word too short", message: "Please enter a word thats longer than your dick in inches (2).")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        score = score + answer.count
        newWord = ""
    }
    
    func startGame() {
        if (score > highScore) {
            highScore = score
        }
        score = 0
        usedWords.removeAll()
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .ascii) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load the start.txt file from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func isNotTheSame(word: String) -> Bool {
        if word == rootWord {
            return false
        }
        return true
    }
    
    func isLongEnough(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
}

#Preview {
    ContentView()
}










