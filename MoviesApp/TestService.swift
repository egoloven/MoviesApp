//
//  TestService.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import Foundation

protocol ServiceProtocol {
    func getMovies(_ page: Int, completion: @escaping (_ movies: [APIResult], _ lastPage: Int) -> Void)
}

class TestService: ServiceProtocol {
    public static let service = TestService()

    private let key = Constants.key
    private let nowPlayingUrl = Constants.nowPlayingUrl
    private let similarMoviesUrl = Constants.similarMoviesUrl

    func getSimilarMovies(for id: Int, completion: @escaping (_ movies: [APIResult]) -> Void) {
        let url = URL(string: "\(similarMoviesUrl)\(id)/similar?api_key=\(key)")!

        let dataTask = URLSession.shared.dataTask(with: url) {
            data, request, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let fullResponse = try decoder.decode(APISimilarResponse.self, from: data)
                    completion(fullResponse.results ?? [])
                }

                catch {
                    print(error.localizedDescription)
                    completion([])
                }

            }

            completion([])
        }

        dataTask.resume()
    }

    func getMovies(_ page: Int, completion: @escaping (_ movies: [APIResult], _ lastPage: Int) -> Void) {
        let url = URL(string: "\(nowPlayingUrl)region=UA&api_key=\(key)&page=\(page)")!

        let dataTask = URLSession.shared.dataTask(with: url) {
            data, request, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let fullResponse = try decoder.decode(APIResponse.self, from: data)
                    completion(fullResponse.results ?? [], fullResponse.totalPages ?? 0)
                }

                catch {
                    print(error.localizedDescription)
                    completion([], 0)
                }

            }

            completion([], 0)
        }

        dataTask.resume()
    }
}
