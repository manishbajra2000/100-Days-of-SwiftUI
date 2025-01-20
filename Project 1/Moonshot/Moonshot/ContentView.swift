//
//  ContentView.swift
//  Moonshot
//
//  Created by Manish Harsha Bajracharya on 20/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
