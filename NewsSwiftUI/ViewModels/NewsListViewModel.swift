//
//  NewsListViewModel.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 14/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation
import Combine

protocol NewsListViewModelProtocol {
    func fetchNews()
}

class NewsListViewModel: ObservableObject {
    @Published var newsItems = [NewsViewModel]()
    @Published var error: Error?
    var subscriptions = [AnyCancellable]()
    let newsFetcher = NewsFetcher()
    var cancellationToken: AnyCancellable?
    
    
}

extension NewsListViewModel: NewsListViewModelProtocol {
    func fetchNews() {
        cancellationToken = newsFetcher.fetchNews(url: UrlEndpoint.getNewsUrl().url!)
            .sink(receiveCompletion: {[weak self] completion in
                switch(completion) {
                case .failure(let error):
                    self?.error = error
                case .finished:
                    print(completion)
                }
                }, receiveValue: {[weak self] value in
                    let articles = value.articles
                    self?.newsItems = articles.map(NewsViewModel.init)
                }
        )
    }
    
    func cancelNewsFetch() {
        cancellationToken?.cancel()
    }
}

extension NewsListViewModel: MockFetcherProtocol {
    func fetchNews() -> [News] {
        let mockFetcherObj = MockFetcher()
        return mockFetcherObj.fetchNews()
    }
    
    
}
