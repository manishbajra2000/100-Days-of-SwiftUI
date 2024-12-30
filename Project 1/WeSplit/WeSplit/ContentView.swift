//
//  ContentView.swift
//  WeSplit
//
//  Created by Manish Harsha Bajracharya on 24/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalAmount: Double{
        let tipPercent = Double(tipPercentage)
        let tipAmount = tipPercent / 100 * checkAmount
        let grandTotal = checkAmount + tipAmount
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let totalPerson = Double(numberOfPeople) + 2
        let totalPerPerson = totalAmount / totalPerson
        return totalPerPerson
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Total Amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                Section("Pay per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

