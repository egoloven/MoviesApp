//
//  constants.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/10/21.
//

import Foundation

struct Constants {
    static let nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?"
    static let similarMoviesUrl = "https://api.themoviedb.org/3/movie/"
    static let preUrl = "https://image.tmdb.org/t/p/original/"
    static let key = <#API Key#>

    static let invalidReleaseDate = "Invalid Release Date"
    static let noSimilarMovies = "No Similar Movies"
    static let similarMovies = "Similar Movies"
    static let invalidTitle = "Invalid Title"
    static let noPoster = "No Poster"
    static let movies = "Movies"

    static let similarMoviesHeight = 200

    static let smMovieListItemHeight = 150
    static let smMovieListItemWidth = 100
    static let smMovieListItemFont = 15

    static let mlMovieListItemHeight = 500
    static let mlMovieListItemFont = 25

    static let startPage = 1
    static let endPage = 100
}
