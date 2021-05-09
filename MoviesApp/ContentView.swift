//
//  ContentView.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            MoviesListView(
                presenter: MoviesListPresenter(
                    interactor: MoviesListInteractor()
                )
            )
            .navigationTitle(
                Text("\(Constants.movies)")
            )
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
