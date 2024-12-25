//
//  DescriptionView.swift
//  NewsApp
//
//  Created by Marvin John on 27.07.24.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var vm: NewsViewModel
    @State var isPressed = false
    let htmlString = "<h1> This is a HTML string </h1> "
//    let title: String
//    let image: String?
//    let description: String?
    let article: GArticle
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                Text(article.webTitle)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5)
                    .padding(.bottom, 40)
                
                
                
                VStack{
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
                                    .cornerRadius(15)
                                    .frame(height: 200)
                                
                                //                                    .padding(20)
                                
                                
                                
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
                .padding(.bottom, 15)
                
                
                // Source and time
                HStack{
                    Text("Detik News ")
                    Text("18 Hours ago")
                    
                    Spacer()
                    
                    Button {
                        
                        isPressed.toggle()
                        if isPressed{
                            vm.addArticle(title: article.webTitle, image: article.fields.thumbnail, description: article.fields.body)
                        }
                        print()
                    } label: {
                        Image(systemName: isPressed ?  "bookmark.fill" : "bookmark")
                            .background(
                                Circle()
                                    .fill(.ghostWhite2)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 2)
                                
                            )
                            .padding(.trailing,20)
                            .padding()
                    }
                    
                }
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.medium)
                
                
                //Description
                
                HTMLView(
                    htmlString: article.fields.body ?? "No description",
                    fontFamily: "Merriweather",
                    fontSize: "200",
                    color: "#0000"
                    
                )
                Text(
                    article.fields.body?.replacingOccurrences(of: "<p>" , with: "")
                        .replacingOccurrences(of: "</p>", with: "")
                        .replacingOccurrences(of: "<a href=\"[^\"]*\">(.*?)</a>", with: "")
                    ?? "No description")
                .font(.custom("Merriweather", size: 20))
                .lineSpacing(8)
                .padding(.top)
                
            }
        }
        .padding()
        .background(Color.ghostWhite)
    }
    
  
    
    
}

#Preview {
    DescriptionView(article: GArticle(webPublicationDate: "", webTitle: "Rumors of Brazil national team, Ancelotti: Contract until 2024" , fields: .init(thumbnail: "https://media.guim.co.uk/42eb9bfebe478b07a6732cab1906c6ee412bb6bf/0_106_3500_2100/500.jpg", body: "Lorem ipsum vehicles using the trail for the entire rainy season if not longer. It would also not cause collateral damage or leave unexploded bombs. The unit carrying out the operation adopted the slogan: “Make mud, not war.”</p> <p>An initial field trial in 1967 appeared to go well, but further drops had little effect. Aerial reconnaissance showed the Vietnamese were covering the affected areas with gravel. Traffic may have been slowed but continued as before. ")))
        .environmentObject(NewsViewModel())
     
}
