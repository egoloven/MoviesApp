//
//  MovieDetailItem.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/10/21.
//

import Foundation
import SwiftUI

struct MovieDetailItem: View {
    var movie: ViewMovie
    let preUrl = Constants.preUrl

    var body: some View {
        VStack {
            RemoteImage(from: movie.posterPath == nil ? "" : preUrl + movie.posterPath!)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
            Text(movie.releaseDate)
        }
    }
}
