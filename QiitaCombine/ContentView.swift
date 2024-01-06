//
//  ContentView.swift
//  QiitaCombine
//
//  Created by Ryuga on 2024/01/06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ArticlesViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.articles, id: \.self) { article in
                    Text(article.title)
                }
            }
            .navigationBarTitle("Qiita Articles")
        }
        .onAppear {
            viewModel.loadArticles()
        }
    }
}


#Preview {
    ContentView()
}
