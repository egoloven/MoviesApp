//
//  MovieDetailInteractor.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation

class MovieDetailInteractor {
    private var movie: ViewMovie

    init(movie: ViewMovie) {
        self.movie = movie
    }

    func getMovie() -> ViewMovie {
        return movie
    }

    func getTitle() -> String {
        return movie.title
    }
}
