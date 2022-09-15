//
//  LoginView.swift
//  SwiftUI-TestApp
//
//  Created by Андрей Рыбалкин on 15.09.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isActive = false
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isAlertPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 100)
                
                    VStack(spacing: 12) {
                        TextField("Email or phone", text: $email)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.emailAddress)
                        
                        TextField("Password", text: $password)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
                            .textFieldStyle(.roundedBorder)                            .textContentType(.password)
                                        
                    Button(action: { isAlertPresented = true }) {
                        Text("Log in")
                    }
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color("main"))
                    .cornerRadius(12)
                    .padding(.top, 16)
                }
                .padding(.horizontal, 50.0)
                Spacer()
            }
            .padding(.top, 100)
            
            .alert("Welcome!",
                   isPresented: $isAlertPresented,
                   actions: {})
            
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 32)
        }
    }
    
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
