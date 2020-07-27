//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 13/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import SwiftUI
import Combine

struct NewsListView: View {
    @ObservedObject var viewModel = NewsListViewModel()
    @State private var errorMessage: String?
    
    var body: some View {
        let isAlertShown = Binding<Bool>(
            get: { self.viewModel.error != nil },
            set: { _ in self.viewModel.error = nil }
        )
        return NavigationView {
            VStack {
                List(viewModel.newsItems) { item in
                    NavigationLink(destination: NewsDetailView(newsItem: item)) {
                        NewsRowView(newsItem: item)
                    }
                }
                .alert(isPresented: isAlertShown){
                    Alert(title: Text("Error"), message: Text("some error"), dismissButton: .default(Text("OK")))
                    
                }
                .navigationBarTitle(Text("News"))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.viewModel.fetchNews()
        }
        .onDisappear{
            self.viewModel.cancelNewsFetch()
        }
    }
    
    
}



struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = NewsListView()
        //view.viewModel = NewsListViewModel()
        return view
    }
}


