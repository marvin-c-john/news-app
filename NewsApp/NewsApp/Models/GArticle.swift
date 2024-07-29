//
//  Technology.swift
//  NewsApp
//
//  Created by Marvin John on 25.07.24.
//

import Foundation

struct GArticlesResponse: Codable {
    let response: GArticlesResult
}

struct GArticlesResult: Codable {
    let results: [GArticle]
}

struct GArticle: Codable, Identifiable {
    var id: String {
        webTitle
    }
    let webPublicationDate: String
    let webTitle: String
    let fields: GArticleFields
}

struct GArticleFields: Codable {
    let thumbnail: String?
    let body: String?
}
