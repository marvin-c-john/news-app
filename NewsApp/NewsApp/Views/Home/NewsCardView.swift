//
//  NewsCardView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct NewsCardView: View {
    @ObservedObject var vm: NewsViewModel
    let title: String
    let image: String?
    let description: String?
    let backgroundShadow: Double
    var body: some View {
        VStack {
            NavigationLink {
                DescriptionView(vm: vm, title: title, image: image, description: description)
            } label: {
                ZStack{
                    HStack{
                        if let imageUrlString = image,
                           let imageUrl = URL(string: imageUrlString) {
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .frame(height: 250)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                        .overlay {
                                            Color.black.opacity(backgroundShadow)
                                        }
                                        .cornerRadius(10)
                                        .padding(20)
                                        .shadow(radius: 10)
                                    
                                    
                                    
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                    
                                    
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 200)
                            
                        }
                    }
                    
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: 230)
                        .offset(x: -58 , y: 35)
                        .padding(.horizontal, -10)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .shadow(radius: 30)
                    
                }

            }

        }
    }
}

#Preview {
    NewsCardView(vm: NewsViewModel(), title: "Alexander wears modified helmet in road races nedenejnejnewjnew ieneifnweifn", image: "", description: "Lorem ipsum vehicles using the trail for the entire rainy season if not longer. It would also not cause collateral damage or leave unexploded bombs. The unit carrying out the operation adopted the slogan: “Make mud, not war.”</p> <p>An initial field trial in 1967 appeared to go well, but further drops had little effect. Aerial reconnaissance showed the Vietnamese were covering the affected areas with gravel. Traffic may have been slowed but continued as before.", backgroundShadow: 0.3)
}

//https://ichef.bbci.co.uk/news/1024/branded_news/881e/live/145bc0f0-4891-11ef-aabe-918677f7d22d.jpg
