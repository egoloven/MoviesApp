//
//  SimilarMoviesRouter.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

class SimilarMoviesRouter {
    func makeMovieDetailView(from movie: ViewMovie) -> some View {
        return MovieDetailView(
            presenter: MovieDetailPresenter(
                interactor: MovieDetailInteractor(movie: movie)
            )
        )
    }
}
