//
//  SegmentedTabView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import Foundation

enum Segmented: Int, CaseIterable{
    case all
    case business
    case culture
    case music
    case science
    case sports
    case technology
    
    var title: String{
        switch self{
        case .all: return "All"
        case .business: return "Business"
        case .culture: return "Culture"
        case .music: return "Music"
        case .science: return "Science"
        case .sports: return "Sport"
        case .technology: return "Technology"
        }
    }
}
