//
//  RemoteImage.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 5/8/21.
//

import Foundation
import SwiftUI


enum LoadingStatus {
    case error
    case loading
    case loaded
}


class RemoteImageLoader {
    public static let cache = RemoteImageLoader()
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var loadingResponses = [NSURL: [(UIImage?, LoadingStatus) -> Swift.Void]]()

    final func offload() {
        loadingResponses = [NSURL: [(UIImage?, LoadingStatus) -> Swift.Void]]()
    }

    final func image(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }

    final func load(from urlString: String, _ completion: @escaping (_ data: UIImage?, _ status: LoadingStatus) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(nil, .error)
            return
        }
        if let cachedImage = image(url: url as NSURL) {
            completion(cachedImage, .loaded)
        }

        if loadingResponses[url as NSURL] != nil {
            loadingResponses[url as NSURL]?.append(completion)
            return
        } else {
            loadingResponses[url as NSURL] = [completion]
        }

        let dataTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let responseData = data, let image = UIImage(data: responseData),
                let blocks = self.loadingResponses[url as NSURL], error == nil else {
                DispatchQueue.main.async {
                    completion(nil, .error)
                }
                return
            }
            // Cache the image.
            self.cachedImages.setObject(image, forKey: url as NSURL, cost: responseData.count)
            // Iterate over each requestor for the image and pass it back.
            for block in blocks {
                DispatchQueue.main.async {
                    block(image, .loaded)
                }
                return
            }
        }
        dataTask.resume()
    }
}

class RemoteImageController: ObservableObject {
    @Published var loadingStatus: LoadingStatus = .loading
    var image: UIImage?

    init(from url: String)  {
        RemoteImageLoader.cache.load(from: url) {
            image, status in
            self.image = image
            self.loadingStatus = status
        }
    }
}

struct RemoteImage: View {
    @ObservedObject var controller: RemoteImageController

    init(from url: String) {
        self.controller = RemoteImageController(from: url)
    }

    var body: some View {
        switch controller.loadingStatus {
        case .loading:
            Rectangle()
                .fill(Color.gray)
                .opacity(0.3)
        case .error:
            Text(Constants.noPoster)
                .font(.title)
        default:
            Image(uiImage: controller.image!)
                .resizable()
        }
    }
}
