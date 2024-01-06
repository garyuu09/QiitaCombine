//
//  Article.swift
//  QiitaCombine
//
//  Created by Ryuga on 2024/01/06.
//

import Foundation

struct Article: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var url: String
}
