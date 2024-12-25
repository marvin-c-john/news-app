//
//  SavedView.swift
//  NewsApp
//
//  Created by Marvin John on 27.07.24.
//

import SwiftUI

struct SavedView: View {
    let article: GArticle
    @EnvironmentObject var vm: NewsViewModel
    var body: some View {
        NavigationView {
          
                VStack{
               
                    List {
                        ForEach(vm.savedArticles){ article in
                            NewsRowView(article: article)
                        }
                        .onDelete(perform: vm.removeArticle)
                    }
                    .listStyle(.inset)
                 
                }
                
                

            .background(Color.ghostWhite)
            .navigationTitle("Saved")
        }
      
       
    }
}

#Preview {
    SavedView(article: GArticle(webPublicationDate: "", webTitle: "Rumors of Brazil national team, Ancelotti: Contract until 2024" , fields: .init(thumbnail: "https://media.guim.co.uk/42eb9bfebe478b07a6732cab1906c6ee412bb6bf/0_106_3500_2100/500.jpg", body: "Lorem ipsum vehicles using the trail for the entire rainy season if not longer. It would also not cause collateral damage or leave unexploded bombs. The unit carrying out the operation adopted the slogan: “Make mud, not war.”</p> <p>An initial field trial in 1967 appeared to go well, but further drops had little effect. Aerial reconnaissance showed the Vietnamese were covering the affected areas with gravel. Traffic may have been slowed but continued as before. ")))
        .environmentObject(NewsViewModel())

}
