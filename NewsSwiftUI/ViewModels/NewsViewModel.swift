//
//  NewsViewModel.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 15/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation
import UIKit

class NewsViewModel: Identifiable, ObservableObject {
    let newsItem: News
    var imageFetcherObj = ImageFetcher()
    
    init(newsItem: News) {
        self.newsItem = newsItem
    }
    
    let id = UUID()
    
    var newsTitle: String {
        return newsItem.title
    }
    
    var newsAuthor: String? {
        return newsItem.author
    }
    
    var newsDescription: String? {
        return newsItem.description
    }
    
    var newsContent: String? {
        return newsItem.content
    }
    
    var newsPublishedDate: String? {
        return newsItem.publishedAt?.dateFormattedString ?? ""
    }
    
    var newsImageUrl: URL? {
        guard let urlString = newsItem.urlToImage else {return nil}
        return URL(string: urlString)
    }
    
    
}
