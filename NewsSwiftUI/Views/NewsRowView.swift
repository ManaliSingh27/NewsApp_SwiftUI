//
//  NewsRowView.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 14/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import SwiftUI

struct NewsRowView: View {
    var newsItem: NewsViewModel
    @ObservedObject var imageFetcher = ImageFetcher()
    var body: some View {
        HStack {
            Image(uiImage: imageFetcher.image ?? UIImage(named: "NewsPlaceholder")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            
            Text(newsItem.newsTitle)
        }.onAppear{
            self.imageFetcher.getImage(url: self.newsItem.newsImageUrl)
        }.onDisappear(){
            self.imageFetcher.cancelImageLoading()
        }
    }
}

