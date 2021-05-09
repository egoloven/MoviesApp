//
//  SimilarMoviesPresenter.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

class SimilarMoviesPresenter {
    var interactor: SimilarMoviesInteractor
    var router: SimilarMoviesRouter = SimilarMoviesRouter()
    @Published var movies: [ViewMovie] = [ViewMovie]()

    init(interactor: SimilarMoviesInteractor) {
        self.interactor = interactor
    }

    func getSimilarMovies() {
        interactor.getSimilarMovies() {
            movies in
            self.movies += movies
        }
    }

    func makeMovieListItem(for movie: ViewMovie) -> some View {
            NavigationLink(destination: router.makeMovieDetailView(from: movie)) {
                MovieListItem(
                    from: movie,
                    height: Constants.smMovieListItemHeight,
                    width: CGFloat(Constants.smMovieListItemWidth),
                    font: Constants.smMovieListItemFont
                )
                    .frame(alignment: .center)
            }
            .buttonStyle(PlainButtonStyle())
    }
}

extension SimilarMoviesPresenter: ObservableObject {}
