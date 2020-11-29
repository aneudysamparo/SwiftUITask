//
//  AppFormError.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct AppFormError: View {
    var errorMessage:String
    
    var body: some View {
        HStack(){
            Image(systemName: "xmark.octagon")
                .foregroundColor(.red)
            ZStack(alignment: .leading){
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
        }.padding(.vertical, 10)
    }
}

struct AppFormError_Previews: PreviewProvider {
    static var previews: some View {
        AppFormError(errorMessage: "Username can't be empty")
    }
}
