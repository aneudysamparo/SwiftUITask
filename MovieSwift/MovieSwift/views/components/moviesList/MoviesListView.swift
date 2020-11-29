//
//  MoviesListView.swift
//  MovieSwift
//
//  Created by Aneudys on 11/29/20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct MoviesListView: View {
    
    @EnvironmentObject private var store: Store<AppState>
    @State private var sortBy = MoviesSort.byReleaseDate
    @State private var isSortActionSheetPresented = false
    
    let movies: [MoviesMenu: [Int]]
    let menu: MoviesMenu
    let displaySearch: Bool
    let listener: MoviesMenuListPageListener
    
    private var sortButton : some  View{
        Button(action: {
            self.isSortActionSheetPresented.toggle()
        }, label: {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .resizable()
                .frame(width: 25, height: 25)
        })
    }
    
    private var sortActionSheet: ActionSheet {
        ActionSheet.sortByDateActionSheet { (sort) in
            if let sort = sort{
                updateSorting(sort: sort)
            }
        }
    }
    
    private func updateSorting(sort: MoviesSort){
        
        if(sortBy != sort){
            sortBy = sort
        }
    }
    
    var body: some View {
        NavigationView{
            MoviesList(movies: movies[menu]?.sortedMoviesIds(by: self.sortBy, state: store.state) ?? [],
                       displaySearch: displaySearch,
                       pageListener: listener,
                       isInnerPage: true)
        }
        .actionSheet(isPresented: $isSortActionSheetPresented, content: { sortActionSheet })
        .navigationBarItems(trailing: (menu == MoviesMenu.popular) ? sortButton : nil)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

