//
//  SimilarMoviesView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI

struct SimilarMoviesView: View {
    @ObservedObject var presenter: SimilarMoviesPresenter
    @State var first = true

    var body: some View {
        if !first {
            if presenter.movies == [ViewMovie]() {
                Text("\(Constants.noSimilarMovies)")
                    .frame(height: CGFloat(Constants.similarMoviesHeight))
            }
            else {
                HStack {
                    ForEach(presenter.movies, id: \.id) {
                        movie in
                        presenter.makeMovieListItem(for: movie)
                    }
                }.frame(height: CGFloat(Constants.similarMoviesHeight))
            }
        }
        else {
            Rectangle().onAppear {
                self.first = false
                presenter.getSimilarMovies()
            }
        }
    }
}
