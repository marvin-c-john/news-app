//
//  HomeView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm : NewsViewModel
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                BreakingNewsView()
                
                
                
                SegmentedTabView()
            }
            .navigationTitle(currentGreeting.message)
            .background(Color.ghostWhite)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(NewsViewModel())
}
