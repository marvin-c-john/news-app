//
//  NewsRowView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct NewsRowView: View {
    let article: GArticle
//    let title: String
//    let image: String?
//    let description: String?
    let htmlString = "<h1> This is a HTML string </h1> "
    @EnvironmentObject var vm: NewsViewModel
    var body: some View {

        VStack {
            NavigationLink {
                DescriptionView(article: article)
            } label: {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.ghostWhite2)
                    .frame(height: 100)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                    .overlay {
                        HStack(spacing: 10) {
                            HStack{
                                if let imageUrlString = article.fields.thumbnail,
                                   let imageUrl = URL(string: imageUrlString) {
                                    AsyncImage(url: imageUrl) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .frame(width: 120 ,height: 20)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .cornerRadius(10)
                                                .frame(width: 100, height: 70)
                                                .overlay {
                                                    Color.black.opacity(0.1)
                                                }
                                                .frame(height: 200)
                                            
                                                .padding(20)
                                            
                                            
                                            
                                        case .failure:
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame( height: 70)
                                                .frame(width: 122)
                                                .padding(.trailing, 15)
                                                .padding(.leading, 7)
                                            
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    
                                } else {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame( height: 70)
                                        .frame(width: 122)
                                        .padding(.trailing, 15)
                                        .padding(.leading, 7)
                                    
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            VStack(alignment: .leading, spacing: 7) {
                                Text(article.webTitle)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.primary)
                                
                                
                                
                                Text(vm.htmlToString(article.fields.body ?? "No description"))
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(maxWidth: 180, alignment: .leading)
                            .padding(.vertical)
                            
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
            }
            .tint(.primary)
        }

            
    }
    
}

#Preview {
    NewsRowView(article: GArticle(webPublicationDate: "", webTitle:  "Biden and Zelensky are set to meet at", fields: .init(thumbnail: "https://media.guim.co.uk/42eb9bfebe478b07a6732cab1906c6ee412bb6bf/0_106_3500_2100/500.jpg", body: "FFJF")))
        .environmentObject(NewsViewModel())
}







