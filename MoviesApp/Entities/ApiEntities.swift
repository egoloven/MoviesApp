//
//  ApiEntities.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation


protocol ViewMovieBase {
    var id: Int? { get set }

    var releaseDate: String? { get set }
    var posterPath: String? { get set }
    var title: String? {get set }
}

class APISimilarResponse: Decodable {
    var results: [APIResult]?

    var totalResults: Int?
    var totalPages: Int?
    var page: Int?

    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

class APIResponse: Decodable {
    var dates: APIDates?
    
    var results: [APIResult]?

    var totalResults: Int?
    var totalPages: Int?
    var page: Int?

    enum CodingKeys: String, CodingKey {
        case results
        case dates
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

class APIDates: Decodable {
    var maximum: String?
    var minimum: String?
}

class APIResult: Decodable, ViewMovieBase {
    var voteCount: Int?
    var id: Int?

    var voteAverage: Double?
    var popularity: Double?

    var genreIds: [Int]?

    var originalLanguage: String?
    var originalTitle: String?
    var backdropPath: String?
    var releaseDate: String?
    var posterPath: String?
    var overview: String?
    var title: String?

    var adult: Bool
    var video: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case voteAverage = "vote_average"
        case voteCount = "vote_count"

        case popularity

        case genreIds = "genre_ids"

        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case title
        case overview

        case adult
        case video
    }
}
