//
//  SimilarMoviesInteractor.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation

class SimilarMoviesInteractor {
    private var movie: ViewMovie

    init(movie: ViewMovie) {
        self.movie = movie
    }

    func getSimilarMovies(comletion: @escaping (_ movies: [ViewMovie]) -> Void) {
        TestService.service.getSimilarMovies(for: movie.id) {
            results in
            var movies = [ViewMovie]()
            for result in results {
                movies.append(ViewMovie(from: result))
            }
            DispatchQueue.main.async {
                comletion(movies)
            }
        }
    }
}
