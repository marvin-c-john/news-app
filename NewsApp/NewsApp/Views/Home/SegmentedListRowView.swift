//
//  SegmentedListRowView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct SegmentedListRowView: View {
    @ObservedObject var vm : NewsViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            switch vm.selectedFilter {
            case .all:
                ForEach(vm.allArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .business:
                ForEach(vm.businessArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .culture:
                ForEach(vm.cultureArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .music:
                ForEach(vm.musicArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .science:
                ForEach(vm.scienceArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .sports:
                ForEach(vm.sportArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
            case .technology:
                ForEach(vm.techArticles) { article in
                    NewsRowView(
                        title: article.webTitle,
                        image: article.fields.thumbnail,
                        description: article.fields.body, vm: vm)
                }
                
            }
        }
        .padding(.top)
    }
}

#Preview {
    SegmentedListRowView(vm: NewsViewModel())
}
