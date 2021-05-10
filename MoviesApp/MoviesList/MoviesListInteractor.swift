//
//  MoviesListInteractor.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation

class MoviesListInteractor {
    var currentPage: Int = Constants.startPage
    var lastPage: Int = Constants.endPage

    func getMovies(_ completition: @escaping ([ViewMovie]) -> Void) {
        TestService.service.getMovies(currentPage, completion: {
            movies, lastPage in
            var viewMovies = [ViewMovie]()
            if self.currentPage <= lastPage {
                self.currentPage += 1
                for movie in movies {
                    viewMovies.append(ViewMovie(from: movie))
                }
            }
            DispatchQueue.main.async {
                completition(viewMovies)
            }
        })
    }
}
