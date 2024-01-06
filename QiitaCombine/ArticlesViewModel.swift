//
//  ArticlesViewModel.swift
//  QiitaCombine
//
//  Created by Ryuga on 2024/01/06.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    private let qiitaService = QiitaService()

    func loadArticles() {
        qiitaService.fetchArticles()
            .print()
            .sink(receiveCompletion: { completion in
                // 完了時の処理、例えばエラー処理
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
}

