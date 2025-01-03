//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Manish Harsha Bajracharya on 30/12/2024.
//

import SwiftUI

struct MyCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(7)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

extension View {
    public func myCustomModifier() -> some View {
        modifier(MyCustomModifier())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0...columns, id: \.self) { column in
                        Spacer()
                        content(row, column)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView: View {

    var body: some View {
        
        GridStack(rows: 3, columns: 3) { row, col in
            
            HStack{
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row)C\(col)")
            }
            .padding(7)
            .background(Color.blue)
            .clipShape(Capsule())
            
            
        }
        
        
        
//        VStack{
//            Image (systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text( "Hello, world!")
//        }
    }
}

#Preview {
    ContentView()
}
