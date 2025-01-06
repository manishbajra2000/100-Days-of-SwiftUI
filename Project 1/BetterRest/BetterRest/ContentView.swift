//
//  ContentView.swift
//  BetterRest
//
//  Created by Manish Harsha Bajracharya on 03/01/2025.
//

import CoreML
import SwiftUI


struct ContentView: View {
    
    @State private var wakeUpTime: Date = defaultWakeUpTime
    @State private var sleepAmount: Double = 8
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
   
    
    static var defaultWakeUpTime: Date {
        let components = DateComponents(hour: 6, minute: 0)
//        components.hour = 6
//        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    var sleepTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUpTime - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
            // more code to come
        }catch {
            return "Error"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    VStack (alignment: .leading, spacing: 10) {
                        Text("What time do you want to wake up?")
                            .font(.headline)
                        
                        DatePicker("Pick a wake up time", selection: $wakeUpTime, displayedComponents: .hourAndMinute )
                            .labelsHidden()
                    }
                }
                
                Section {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("How much sleep do you want?")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                }

                Section {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("How much coffee do you want?")
                            .font(.headline)
                        
//                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20, step: 1)
                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 0...20, step: 1)
                        
                        Picker("Coffee intake", selection: $coffeeAmount) {
                            ForEach(0..<21) {
                                Text("^[\($0) cup](inflect: true)")
                            }
                        }

                    }
                }
                
                Section {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Recommended Sleep Time: \(sleepTime)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }
                }

                
            }
            .navigationTitle(Text("BetterRest"))
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        
                
    }
    
    
//    func calculateBedtime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//            
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//            
//            let sleepTime = wakeUpTime - prediction.actualSleep
//            
//            alertTitle = "Your bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//            // more code to come
//        }catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
//        }
//        
//        showingAlert = true
//    }
    
}

#Preview {
    ContentView()
}
