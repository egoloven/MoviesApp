//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/9/21.
//

import Foundation
import SwiftUI


struct MovieDetailView: View {
    @ObservedObject var presenter: MovieDetailPresenter

    var body: some View {
        VStack {
            presenter.makeDetailView()
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
            Text("\(Constants.similarMovies)")
                .font(.largeTitle)
            ScrollView(.horizontal) {
                presenter.makeSimilarMoviesList()
            }
        }
        .navigationTitle(Text("\(presenter.getTitle())"))
    }
}
