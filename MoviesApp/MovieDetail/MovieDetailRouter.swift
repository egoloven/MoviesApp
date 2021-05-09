//
//  MovieDetailRouter.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

class MovieDetailRouter {
    func makeSimilarMoviesView(for movie: ViewMovie) -> some View {
        SimilarMoviesView(
            presenter: SimilarMoviesPresenter(
                interactor: SimilarMoviesInteractor(movie: movie)
            )
        )
    }
}
