//
//  News.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import Foundation


// Modell für die Quelle der Nachricht
struct Source: Codable {
    let id: String?
    let name: String
}

// Modell für einen einzelnen Artikel
struct Article: Codable, Identifiable {
    var id: String {
         url
     }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// Modell für die vollständige Antwort
struct Articles: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
