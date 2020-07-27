//
//  UrlEndpoint.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 16/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation

struct UrlEndpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension UrlEndpoint {
    
    
    static func getNewsUrl() -> UrlEndpoint {
        return UrlEndpoint(
            path: "/v2/top-headlines",
            queryItems: [
                URLQueryItem(name: "country", value: "nl"),
            ]
        )
    }
    
    
}

extension UrlEndpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

