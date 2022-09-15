//
//  ContentView.swift
//  SwiftUI-TestApp
//
//  Created by Андрей Рыбалкин on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter: Float = 0
    @State private var isAlertPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationLink(destination: LoginView()) {
                        Text("Перейти к реализации 3 задачи")
                    }
                .padding()
                
                Text("Hello, SwitUI!")
                    .modifier(TitleModifier())
                    .padding(.bottom, 32)
                Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                    .modifier(TextModifier())
                                
                Circle()
                    .frame(width: 30, height: 30)
                
                VStack {
                    Text("\(counter)")
                    Slider(
                        value: $counter,
                        in: 0...10,
                        onEditingChanged: { _ in })
                    
                    Button("Tap on me") { isAlertPresented = true }
                }
                Spacer()
            }
            .alert("Hello",
                   isPresented: $isAlertPresented,
                   actions: {})
            .searchable(text: $text)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 32)
        }
        .debug()
    }
}

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(Color.black)
            .padding()
            .background(Color.cyan)
            .cornerRadius(16)
    }
}

struct TextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline.bold())
            .foregroundColor(Color.white)
            .padding()
            .background(Color.brown)
            .cornerRadius(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
        print("Example of view structure: \(Mirror(reflecting: self).subjectType)")
        return self
    }
}
