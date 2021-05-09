//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation
import SwiftUI

struct MoviesListView: View {
    @ObservedObject var presenter: MoviesListPresenter

    var body: some View {
        List {
            ForEach(presenter.movies, id: \.id) {
                item in
                presenter.buildMovieView(for: item)
            }
            Text("\(presenter.movies.count) titles")
                .font(.system(size: 13, weight: .light))
                .frame(width: UIScreen.main.bounds.width * 0.9,alignment: .center)
                .onAppear {
                    presenter.getMovies()
            }
        }
    }
}
