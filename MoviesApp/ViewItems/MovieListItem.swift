//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

struct MovieListItem: View {
    var movie: ViewMovie

    var height: Int
    var width: CGFloat
    var font: Int

    let preUrl = Constants.preUrl

    init(from movie: ViewMovie, height: Int, width: CGFloat, font: Int) {
        self.movie = movie
        self.height = height
        self.width = width
        self.font = font
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            RemoteImage(from: movie.posterPath == nil ? "" : preUrl + movie.posterPath!)
                .frame(height: CGFloat(height), alignment: .center)
            Text("\(movie.title)")
                .frame(height: CGFloat(font))
                .multilineTextAlignment(.center)
                .font(Font.custom("Title", size: CGFloat(font)))

        }
        .frame(width: width, alignment: .center)
    }
}
