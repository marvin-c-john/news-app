//
//  NewsRowView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct NewsRowView: View {
    let title: String
    let image: String?
    let description: String?
    let htmlString = "<h1> This is a HTML string </h1> "
    @ObservedObject var vm: NewsViewModel
    var body: some View {
        NavigationLink {
            DescriptionView(vm: vm, title: title, image: image, description: description ?? "No description")
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
                            if let imageUrlString = image,
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
                            Text(title)
                                .lineLimit(2)
                                .font(.subheadline)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.primary)
                              
                            
                            
                            Text(vm.htmlToString(description ?? "No description"))
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

#Preview {
    NewsRowView(title: "Biden and Zelensky are set to meet at", image: "https://media.guim.co.uk/42eb9bfebe478b07a6732cab1906c6ee412bb6bf/0_106_3500_2100/500.jpg", description: "Lorem ipsum vehicles using the trail for the entire rainy season if not longer. It would also not cause collateral damage or leave unexploded bombs. The unit carrying out the operation adopted the slogan: “Make mud, not war.”</p> <p>An initial field trial in 1967 appeared to go well, but further drops had little effect. Aerial reconnaissance showed the Vietnamese were covering the affected areas with gravel. Traffic may have been slowed but continued as before. < ", vm: NewsViewModel())
}







