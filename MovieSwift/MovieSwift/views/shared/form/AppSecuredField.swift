//
//  AppSecuredField.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct AppSecuredField: View {
    //MARK:  - PROPERTIES
    var icon: String
    var placeholder: Text
    var fontName: String
    var fontSize: CGFloat
    var fontColor: Color
    
    @Binding var text: String
    @Binding var isFormSubmitted: Bool
    
    //MARK: OPTIONAL PROPERTIES
    var label:String?
    var isRequired: Bool?
    
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = {}
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: icon)
                    .foregroundColor(fontColor)
                
                ZStack(alignment:.leading){
                    if text.isEmpty {placeholder.modifier(AppTextStyle(fontName: fontName, fontSize: fontSize, fontColor: fontColor))}
                    SecureField("", text: $text, onCommit: commit)
                        .modifier( AppTextStyle(fontName: fontName, fontSize: fontSize, fontColor: fontColor))
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 20)
            .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.steam_gold, lineWidth: 1.25)
                )
            
            if (isFormSubmitted && text.isEmpty && label != nil || (isRequired != nil && isRequired!)) {
                ZStack(alignment: .leading){
                    AppFormError(errorMessage: "\(label?.capitalized ?? "") can't be empty")
                }
            }else {
                EmptyView()
            }
        }
    }
}
