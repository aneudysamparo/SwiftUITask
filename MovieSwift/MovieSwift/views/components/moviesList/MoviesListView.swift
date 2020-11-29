//
//  MoviesListView.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct MoviesListView: View {
    
    let movies: [MoviesMenu: [Int]]
    let menu: MoviesMenu
    let displaySearch: Bool
    let listener: MoviesMenuListPageListener
    
    private var sortButton : some  View{
        Button(action: {
            print("Order sheet")
            print("Menu \(menu)")
        }, label: {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .resizable()
                .frame(width: 25, height: 25)
        })
    }
    
    var body: some View {
        NavigationView{
            MoviesList(movies: movies[menu] ?? [],
                       displaySearch: displaySearch,
                       pageListener: listener,
                       isInnerPage: true)
        }
        .navigationBarItems(trailing: (menu == MoviesMenu.popular) ? sortButton : nil)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

