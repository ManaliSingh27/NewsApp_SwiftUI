//
//  ImageFetcher.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 15/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol ImageFetcherProtocol {
    func getImage(url: URL?)
}

final class ImageFetcher: ImageFetcherProtocol, ObservableObject {
    @Published  var image: UIImage?
    var cancellable: AnyCancellable?

    func getImage(url: URL?) {
        if let imageUrl = url {
            cancellable = URLSession.shared.dataTaskPublisher(for: imageUrl)
                .map { UIImage(data: $0.data) }
                .replaceError(with: UIImage(systemName: "photo"))
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: {[weak self] value in
                    self?.image = value
                })}
    }
    
    func cancelImageLoading() {
        cancellable?.cancel()
    }
}
