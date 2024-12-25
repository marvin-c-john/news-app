//
//  SegmentedListRowView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct SegmentedListRowView: View {
    @EnvironmentObject var vm: NewsViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            switch vm.selectedFilter {
            case .all:
                ForEach(vm.allArticles) { article in
                    NewsRowView(article: article)
                }
            case .business:
                ForEach(vm.businessArticles) { article in
                    NewsRowView(article: article)
                }
            case .culture:
                ForEach(vm.cultureArticles) { article in
                    NewsRowView(article: article)
                }
            case .music:
                ForEach(vm.musicArticles) { article in
                    NewsRowView(article: article)
                }
            case .science:
                ForEach(vm.scienceArticles) { article in
                    NewsRowView(article: article)
                }
            case .sports:
                ForEach(vm.sportArticles) { article in
                    NewsRowView(article: article)
                }
            case .technology:
                ForEach(vm.techArticles) { article in
                    NewsRowView(article: article)
                    
                }
            }
               
        }
        .padding(.top)
    }
}

#Preview {
    SegmentedListRowView()
        .environmentObject(NewsViewModel())
}
