//
//  NewsDetailView.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 15/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {
    var newsItem: NewsViewModel
    @ObservedObject var imageFetcherObj = ImageFetcher()
    var body: some View {
        VStack {
            ScrollView {
            VStack(alignment: .leading, spacing: 20.0) {
                if(imageFetcherObj.image != nil)
                {
                    Image(uiImage: imageFetcherObj.image!)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }

                Text(newsItem.newsTitle).foregroundColor(.black).font(.headline)
                newsItem.newsAuthor.map({Text($0)})?.foregroundColor(.gray).font(.subheadline)
                newsItem.newsPublishedDate.map({Text($0)})?.foregroundColor(.blue).font(.footnote)
                newsItem.newsDescription.map({Text($0)})?.font(.subheadline)
                
                
                newsItem.newsContent.map({Text($0)})?.font(.subheadline)
                
                Spacer()
                
                }.padding()
            }
        }.onAppear{
            self.imageFetcherObj.getImage(url: self.newsItem.newsImageUrl)
        }
    }
}

//struct NewsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetailView(newsItem: News(author: "author", title: "test", description: "description", url: nil, urlToImage: nil, content: "content", publishedAt: "date"))
//    }
//}
