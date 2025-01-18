//
//  ContentView.swift
//  iExpense
//
//  Created by Manish Harsha Bajracharya on 16/01/2025.
//

import Observation
import SwiftUI

//struct SecondView: View {
//    let name: String
//    @Environment(\.dismiss) var dismiss
//    var body: some View {
//        Text("Hello, \(name)!")
//        Button("Dismiss") {
//            dismiss()
//        }
//    }
//}
//
//struct ThirdView: View {
//    @Environment(\.dismiss) var cancel
//    var body: some View  {
//        VStack {
//            Button("Cancel") {
//                cancel()
//            }
//        }
//    }
//}
//
//@Observable
//class User {
//    var firstName: String = "Bellatrix"
//    var lastName: String = "Lestrange"
//}
//
//struct ContentView: View {
//    
//    @State private var user = User()
//    
//    @State private var showingSecondView = false
//    
//    @State private var showingThirdView = false
//    
//    var body: some View {
//        VStack {
//            Text("My name is \(user.firstName) \(user.lastName).")
//            TextField("Enter First Name", text: $user.firstName)
//            TextField("Enter Last Name", text: $user.lastName)
//            
//            Spacer(minLength: 20)
//            
//            Button("Show me Second View") {
//                showingSecondView.toggle()
//            }
//            Spacer()
//            Button("Show me Third View.") {
//                showingThirdView.toggle()
//            }
//            Spacer()
//            
//        }
//        .padding()
//        .sheet(isPresented: $showingSecondView) {
//            SecondView(name: "Draco")
//        }
//        .sheet(isPresented: $showingThirdView) {
//            ThirdView()
//        }
//    }
//}

//struct ContentView: View {
//    
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//    
//    var body: some View {
//        NavigationStack{
//            VStack{
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                
//                Button("Add number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//                
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
//    }
//    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//    
//}

//struct ContentView: View {
//    
//    @AppStorage("tapCount") private var tapCount = 0
//    var body: some View {
//        VStack {
//            Button("Tap Count: \(tapCount)") {
//                tapCount += 1
//                
//                //UserDefaults.standard.set(tapCount, forKey: "tapcount")
//                 
//            }
//        }
//    }    
//}

struct UserData: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    var body: some View {
        
        let user = UserData(firstName: "Harry", lastName: "Potter")
        
        Button("Save userdata") {
            let  encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
