//
//  ViewMovie.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation

///All needed information for views from API
class ViewMovie {
    var id: Int
    var releaseDate: String
    var posterPath: String?
    var title: String

    ///create ViewMovie from other that could be a base for it
    init(from movie: ViewMovieBase) {
        self.id = movie.id ?? -1
        self.title = movie.title ?? Constants.invalidTitle
        self.releaseDate = movie.releaseDate ?? Constants.invalidReleaseDate
        self.posterPath = movie.posterPath
    }
}

extension ViewMovie: Equatable {
    static func == (lhs: ViewMovie, rhs: ViewMovie) -> Bool {
        return lhs.id == rhs.id
    }
}

extension ViewMovie: Identifiable {}
