//
//  ContentView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            MoviesListView(
                presenter: MoviesListPresenter(
                    interactor: MoviesListInteractor()
                )
            )
            .navigationTitle(
                Text("\(Constants.movies)")
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
