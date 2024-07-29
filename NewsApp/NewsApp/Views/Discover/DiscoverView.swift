//
//  DiscoverView.swift
//  NewsApp
//
//  Created by Marvin John on 25.07.24.
//

import SwiftUI

struct DiscoverView: View {
    @ObservedObject var vm : NewsViewModel
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Search", text: $vm.query)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .padding()
                        .onChange(of: vm.query) { _, newValue in
                            Task {
                                vm.searchArticles()
                             
                            }
                        }

                    
                    ForEach(vm.searchedArticles){ article in
                        NewsRowView(
                            title: article.webTitle,
                            image: article.fields.thumbnail,
                            description: article.fields.body,
                            vm: vm
                        )
                    }
                }
                .navigationTitle("Discover")
            }
            .background(Color.ghostWhite)
        }
    }
}

#Preview {
    DiscoverView(vm: NewsViewModel())
}
