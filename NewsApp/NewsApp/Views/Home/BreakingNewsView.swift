//
//  BreakingNewsView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct BreakingNewsView: View {
    
    
    @ObservedObject var vm: NewsViewModel
    
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
                    GeometryReader { geometry in
                        TabView() {
                            ForEach(vm.articles) { article in
                                NewsCardView(
                                    vm: vm,
                                    title: article.title,
                                    image: article.urlToImage, description: article.content, backgroundShadow: 0.3
                                )
                                
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .onAppear {
                            vm.setupAppearance()
                          }
                        .shadow(radius: 3)
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    }
                    .frame(height: 380)
                    
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
    BreakingNewsView(vm: NewsViewModel())
}
