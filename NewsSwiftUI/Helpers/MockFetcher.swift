//
//  MockFetcher.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 14/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation

protocol MockFetcherProtocol {
    func fetchNews() -> [News]
}
class MockFetcher {
   
     var newsItems = [News(author: "test auth", title: "test title", description: "test description", url: nil, urlToImage: nil, content: nil, publishedAt: nil),
    News(author: "test auth1", title: "test title1", description: "test description", url: nil, urlToImage: nil, content: nil, publishedAt: nil),
    News(author: "test auth2", title: "test title2", description: "test description", url: nil, urlToImage: nil, content: nil, publishedAt: nil),
    News(author: "test auth3", title: "test title3", description: "test description", url: nil, urlToImage: nil, content: nil, publishedAt: nil),
    News(author: "test auth4", title: "test title4", description: "test description", url: nil, urlToImage: nil, content: nil, publishedAt: nil)
    ]
   
    
    func fetchNews() -> [News] {
           return newsItems
       }
    
}
