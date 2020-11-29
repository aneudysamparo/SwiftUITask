//
//  LoginView.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    //MARK: - ENV Vars
    @Environment(\.colorScheme) var colorScheme
    
    //MARK: - PRIVATE PROPERTIES
    @State private var username = ""
    @State private var password = ""
    @State private var isFormSubmitted: Bool = false
    @State private var hasCredentialsError: Bool = false
    @State private var isLoading: Bool = false
    
    //MARK: - APPSTORAGE PROPERTIES
    @AppStorage("username") var loginUsername: String?
    @AppStorage("password") var loginPassword: String?
    @AppStorage("isValidCredentialOrUserLogged") var validCredentialOrUserLogged: Bool?
    
    private func validateCredential() {
        self.isLoading = true
        self.isFormSubmitted = true
        self.hasCredentialsError = false
        
        if(username.lowercased() != self.loginUsername?.lowercased() || password != self.loginPassword ){
            self.isLoading = false
            self.hasCredentialsError = true
        }
        else {
            let _: () = DispatchQueue.main.schedule(after: .init(.now() + 1.3)) {
                self.validCredentialOrUserLogged = true
                print("login")
            }
        }
    }
    
    var body: some View {
        
        // Wrapper
        ZStack{
            // BG COLOR
            Color.steam_background
            
            VStack{
                // LOGO
                Image("app_logo")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 3, x: 2, y: 2)
                    .cornerRadius(20.0)
                
                // SPACER
                Spacer().frame(height: 50.0)
                
                //FORM
                VStack(spacing: 15.0){
                    VStack(spacing: 10.0){
                        // Username
                        AppTextField(
                            icon: "person",
                            placeholder: Text("Username"),
                            fontName: "FHACondFrenchNC",
                            fontSize: 18,
                            fontColor: (colorScheme == .dark ) ? Color.white.opacity(0.5) : Color.black.opacity(0.5),
                            text: $username,
                            isFormSubmitted: $isFormSubmitted,
                            label: "Username")
                        
                        // Password
                        AppSecuredField(
                            icon: "lock",
                            placeholder: Text("Password"),
                            fontName: "FHACondFrenchNC",
                            fontSize: 18,
                            fontColor: (colorScheme == .dark ) ? Color.white.opacity(0.5) : Color.black.opacity(0.5),
                            text: $password,
                            isFormSubmitted: $isFormSubmitted,
                            label: "Password")
                        
                        if(isFormSubmitted && hasCredentialsError){
                            AppFormError(errorMessage: "Invalid credentials")
                        }
                    }// VStack-Inputs
                    
                    
                    //LOGIN BUTTON
                    if(isLoading){
                        AppActivityIndicator(isAnimating: .constant(true), style: .large)
                            .foregroundColor(.white)
                    }else {
                        Button(action: validateCredential){
                            Text("login".uppercased())
                                .modifier(
                                    AppTextStyle(
                                        fontName: "FHACondFrenchNC",
                                        fontSize: 20,
                                        fontColor: .white)
                                )
                                .modifier(
                                    AppButtonStyle(
                                        buttonHeight: 60,
                                        buttonColor: .steam_gold,
                                        buttonRadius: 20)
                                )
                            
                        }
                        .padding(.vertical, 30.0)
                    }
                    
                }// VStack-Form
                .padding(.horizontal, 20)
                
            }//VStack
        }// ZStack
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
