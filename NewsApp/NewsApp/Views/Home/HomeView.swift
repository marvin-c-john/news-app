//
//  HomeView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm : NewsViewModel
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                BreakingNewsView(vm: vm)
                
                
                
                SegmentedTabView(vm: vm)
            }
            .navigationTitle(currentGreeting.message)
            .background(Color.ghostWhite)
        }
    }
}

#Preview {
    HomeView(vm: NewsViewModel())
}
