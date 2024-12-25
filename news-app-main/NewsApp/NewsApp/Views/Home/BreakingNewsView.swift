//
//  BreakingNewsView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct BreakingNewsView: View {
    
    
    @EnvironmentObject var vm: NewsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: -10){
                
                // Breaking News
                HStack{
                    Text("Breaking News")
                        .font(.title2)
                        .bold()
                        .offset(y: 35)
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                
                // NewsCard
                withAnimation(.spring) {
                    TabView {
                        ForEach(vm.articles) { article in
                            NewsCardView(article: GArticle(webPublicationDate: "", webTitle: article.title, fields: .init(thumbnail: article.urlToImage, body: article.description)), backgroundShadow: 0.3)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(height: 380)
                    .onAppear {
                        vm.setupAppearance()
                    }

                    
                }
                
            }
        }
        .onAppear {
            vm.fetchBreakingNews()
            
        }
        .onTapGesture {
            print(vm.articles)
        }
    }

}

#Preview {
    BreakingNewsView()
        .environmentObject(NewsViewModel())
}
