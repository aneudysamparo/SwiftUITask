//
//  LoginView.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    //MARK: - PRIVATE PROPERTIES
    @State private var username = ""
    @State private var password = ""
    @State private var isFormSubmitted: Bool = false
    @State private var hasCredentialsError: Bool = false
    
    //MARK: - APPSTORAGE PROPERTIES
    @AppStorage("isUserLogged") var isUserLogged: Bool?
    @AppStorage("username") var loginUsername: String?
    @AppStorage("password") var loginPassword: String?
    @AppStorage("isValidCredentialOrUserLogged") var validCredentialOrUserLogged: Bool?
    
    var body: some View {
        
        // Wrapper
        ZStack{
            // BG COLOR
            Color.gray
            
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
                    
                    
                    //LOGIN BUTTON
                    Button(action: {print("Login Button")}){
                        Text("login".uppercased())
                            .modifier(AppTextStyle(fontName: "FHACondFrenchNC", fontSize: 20, fontColor: .black))
                            .modifier(AppButtonStyle(buttonHeight: 60, buttonColor: .steam_gold, buttonRadius: 20))
                        
                    }
                    .padding(.horizontal, 35.0)
                    .padding(.vertical, 30.0)
                }// VStack-Form
                
            }//VStack
        }// ZStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
