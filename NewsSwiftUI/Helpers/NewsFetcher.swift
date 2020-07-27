//
//  Parser.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 14/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation
import Combine
import UIKit

enum CustomError: String, Error {
    case authenticationError
    case downloadError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .authenticationError:
            return "There seems to be some problem. Please try again later"
        case .downloadError:
            return "Download Failed. Please try again later"
        }
    }
}

protocol NewsFetcherProtocol {
    func fetchNews(url: URL) -> AnyPublisher<Articles,Error>
}

class NewsFetcher: NewsFetcherProtocol{
    private var dataPublisher: AnyCancellable?
    private var session: URLSession {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Accept": "application/json",
            "X-Api-Key": NetworkConstants.API_KEY
        ]
        return URLSession(configuration: config)
    }
    
    func fetchNews(url: URL) -> AnyPublisher<Articles,Error> {
        var dataPublisher: AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>
        dataPublisher = session
            .dataTaskPublisher(for: url)
            .eraseToAnyPublisher()
        return dataPublisher
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    if let resp = output.response as? HTTPURLResponse, (401...403).contains(resp.statusCode){
                        throw CustomError.authenticationError
                    }
                    throw CustomError.downloadError
                }
                return output.data
        }
        .retry(3)
        .decode(type: Articles.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

