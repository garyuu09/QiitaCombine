//
//  QiitaService.swift
//  QiitaCombine
//
//  Created by Ryuga on 2024/01/06.
//

import Foundation
import Combine

class QiitaService {
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        guard let url = URL(string: "https://qiita.com/api/v2/tags/swift/items") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .print()
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [Article].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
