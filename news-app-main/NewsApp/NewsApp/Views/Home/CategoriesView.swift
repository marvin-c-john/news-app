//
//  CategoriesView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct CategoriesView: View {
    let category: String
    var body: some View {
       Capsule()
            .foregroundStyle(.blue)
            .frame(width: 55, height: 25)
            .shadow(radius: 10)
            .overlay {
                Text(category)
                    .font(.caption)
                    .foregroundStyle(.white)
            }

            
    }
}

#Preview {
    CategoriesView(category: "Sport")
}
