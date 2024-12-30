//
//  ContentView.swift
//  ConvertIt
//
//  Created by Manish Harsha Bajracharya on 26/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputTemperature: String = ""
    @FocusState var inputTemperatureFocus: Bool
    
    var returnCelsius: Double {
        return Double(inputTemperature) ?? 0
    }
    
    var returnFarhenheit: Double {
        let celsius = Double(inputTemperature) ?? 0
        return celsius * 9/5 + 32
    }
    
    var returnKelvin: Double {
        let celsius = Double(inputTemperature) ?? 0
        return celsius + 273.15
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Temperature in Celsius", text: $inputTemperature)
                        .keyboardType(.decimalPad)
                        .focused($inputTemperatureFocus)
                }
                
                Section {
                    Text("Temperature in Celsius: \(returnCelsius)")
                    Text("Temperature in Fahrenheit: \(returnFarhenheit)")
                    Text("Temperature in Kelvin: \(returnKelvin)")
                }
            }
            .navigationTitle(Text("ConvertIt"))
            .toolbar{
                if inputTemperatureFocus{
                    Button("Done") {
                        inputTemperatureFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
