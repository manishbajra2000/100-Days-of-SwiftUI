//
//  ContentView.swift
//  Animations
//
//  Created by Manish Harsha Bajracharya on 09/01/2025.
//

import SwiftUI


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    @State private var animationAmount2 = 0.0 //degrees
    
    @State private var animationEnabled = true
    
    @State private var dragAmount = CGSize.zero // gragAmount: CGSize = .zero
    @State private var dragAmount1: CGSize = .zero
    
    @State private var showViews = false
    
    @State private var isShowingRed = false
    
    let string = Array("Drag Me Too!")
    
    var body: some View {
        
        
        // Customizing Implicit Animations
        
//        VStack{
//            Spacer()
//            
//            Button("Tap me"){
//                animationAmount += 1
//            }
//                .padding(50)
//                .background(Color.red)
//                .foregroundStyle(.white)
//                .font(.largeTitle)
//                .clipShape(.circle)
//                .scaleEffect(animationAmount)
//                .blur(radius: (animationAmount - 1) * 3)
//                .animation(
//                    .easeInOut(duration: 1).repeatForever(autoreverses: true),
//                    value: animationAmount
//                )
//            
//            Spacer()
//            
//            Button("Tap me"){
//                animationAmount += 1
//            }
//                .padding(50)
//                .background(Color.red)
//                .foregroundStyle(.white)
//                .font(.largeTitle)
//                .clipShape(.circle)
//                .overlay(
//                    Circle()
//                        .stroke(.red)
//                        .scaleEffect(animationAmount)
//                        .opacity(2 - animationAmount)
//                        .animation(
//                            .easeOut(duration: 1).repeatForever(autoreverses: false),
//                            value: animationAmount
//                        )
//                )
//            
//            Spacer()
//            
//        }
        
        
        
        
        // Animating Bindings
        
//        print(animationAmount)
//        
//        return VStack{
//            Spacer()
//            Button("Tap me"){
//                animationAmount += 1
//            }
//                .padding(50)
//                .background(Color.red)
//                .foregroundStyle(.white)
//                .font(.largeTitle)
//                .clipShape(.circle)
//                .scaleEffect(animationAmount)
//                
//            Spacer()
//            Stepper("Size", value: $animationAmount.animation(
//                .easeInOut.repeatCount(3, autoreverses: true)
//                .delay(1)
//            ), in: 0.5...10, step: 0.5)
//            Spacer()
//        }
        
        
        // Explicit Animations
        
//        VStack {
//            Button("Tap me") {
//                withAnimation(.spring(duration: 1, bounce: 0.5)) {
//                    animationAmount2 += 360
//                }
//            }
//            .padding(50)
//            .background(Color.red)
//            .foregroundStyle(.white)
//            .font(.largeTitle)
//            .clipShape(.circle)
//            .rotation3DEffect(.degrees(animationAmount2), axis: (x: 1, y: 1, z: 0))
//        }
            
        
        // Controlling animation stack
//        Button("Tap me"){
//            animationEnabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(animationEnabled ? Color.black.opacity(0.5) : Color.pink)
//        .foregroundStyle(.white)
//        .animation(nil, value: animationEnabled)
//        .clipShape(.rect(cornerRadius: animationEnabled ? 0 : 60))
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationEnabled)
//        .background(animationEnabled ? Color.cyan : Color.purple)
        
        
        // Animating Gestures
        
//        Button("Tap to show") {
//            withAnimation{
//                showViews.toggle()
//                
//            }
//        }
//        
//        if showViews{
//            VStack (spacing: 0) {
//                
//                Spacer()
//                ZStack{
//                    LinearGradient (colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    Text("D R A G   M E !")
//                        .foregroundStyle(.white.opacity(dragAmount1 == .zero ? 0.8 : 0.1))
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        
//                }
//                .frame(width: 300, height: 200)
//                .clipShape(.rect(cornerRadius: 10))
//                .offset(dragAmount1)
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount1 = $0 .translation }
//                        .onEnded { _ in
//                            dragAmount1 = .zero
//                        }
//                )
//                .animation(.bouncy, value: dragAmount1)
//                
//                Spacer()
//                
//                HStack(spacing: 0) {
//                    ForEach (0..<string.count, id: \.self) { num in
//                        Text(String(string[num]))
//                            .padding(5)
//                            .font(.title)
//                            .background(animationEnabled ? .red : .blue)
//                            .offset(dragAmount)
//                            .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//                    }
//                }
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount = $0.translation }
//                        .onEnded { _ in
//                            dragAmount = .zero
//                            animationEnabled.toggle()
//                        }
//                )
//                
//                Spacer()
//                
//            }
//            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//        }
        
        
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}
#Preview {
    ContentView()
}
