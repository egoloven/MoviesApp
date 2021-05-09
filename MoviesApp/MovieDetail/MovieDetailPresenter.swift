//
//  MovieDetailPresenter.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

class MovieDetailPresenter {
    var interactor: MovieDetailInteractor
    var router: MovieDetailRouter = MovieDetailRouter()

    init(interactor: MovieDetailInteractor) {
        self.interactor = interactor
    }

    func getTitle() -> String {
        return interactor.getTitle()
    }

    func makeDetailView() -> some View {
        MovieDetailItem(movie: interactor.getMovie())
    }

    func makeSimilarMoviesList() -> some View {
        router.makeSimilarMoviesView(for: interactor.getMovie())
    }
}

extension MovieDetailPresenter: ObservableObject {}

