//
//  News.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 13/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation

struct News: Codable {
    
    var author: String?
    var title: String
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    var publishedAt: String?
    
    
}

struct Articles : Codable {
    let articles: [News]
}
