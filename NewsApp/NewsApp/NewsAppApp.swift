//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
           ContentView(vm: NewsViewModel())
        }
    }
}
