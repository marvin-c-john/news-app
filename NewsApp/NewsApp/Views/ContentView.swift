//
//  ContentView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = NewsViewModel()
    let title: String = ""
    let image: String? = ""
    let description: String? = ""
    var body: some View {
        VStack {
            TabView{
                HomeView(vm: vm)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                DiscoverView(vm: vm)
                    .tabItem {
                        Label("Discover", systemImage: "safari")
                    }
                
                SavedView(title: title, image: image, description: description, vm: vm)
                    .tabItem {
                        Label("Save", systemImage: "bookmark.fill" )
                    }
                
                HomeView(vm: vm)
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
            .tint(.savoyBlue)
        }
    }
}

#Preview {
    ContentView()
}
