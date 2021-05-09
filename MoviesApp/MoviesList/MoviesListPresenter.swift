//
//  MoviesListPresenter.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation
import SwiftUI

class MoviesListPresenter: ObservableObject {
    var interactor: MoviesListInteractor

    var router = MovieListRouter()
    @Published var movies: [ViewMovie] = [ViewMovie]()

    init(interactor: MoviesListInteractor) {
        self.interactor = interactor
    }

    func getMovies() {
        interactor.getMovies {
            newMovies in
            DispatchQueue.main.async {
                self.movies += newMovies
            }
        }
    }

    func buildMovieView(for movie: ViewMovie) -> some View {
        ZStack {
            NavigationLink(destination: router.makeMovieDetailView(from: movie)) {
                EmptyView()
            }
            .opacity(0)
            .buttonStyle(PlainButtonStyle())
            MovieListItem(
                from: movie,
                height: Constants.mlMovieListItemHeight,
                width: UIScreen.main.bounds.width * 0.9,
                font: Constants.mlMovieListItemFont
            )
                .frame(alignment: .center)
        }
    }
}
