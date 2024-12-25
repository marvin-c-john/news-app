//
//  SegmentedTabView.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import SwiftUI

struct SegmentedTabView: View {
    @EnvironmentObject var vm: NewsViewModel
    var body: some View {
        VStack{
            HStack {
                Text("Trending Topics")
                    .font(.title2)
                    .bold()
                    .padding(.trailing, 10)
                
                Spacer()
            }
            .padding(.trailing, 10)
            .padding(.vertical, 25)
            .padding(.horizontal)
            //Segmented Tabs
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(Segmented.allCases, id: \.rawValue){ segment in
                        VStack{
                            Text(segment.title)
                                .foregroundStyle(vm.selectedFilter  == segment ? .white : .black)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background (
                                    
                                    Capsule()
                                        .fill( vm.selectedFilter == segment ? .savoyBlue : .gray.opacity(0.2))
                                        .frame(height: 40)
                                )
                                .padding(.trailing, 5)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedFilter = segment
                                    }
                                }
                        }
                    }
                    .frame(height: 50)
                    
                }
            }
            .padding(.horizontal)
            
            //Content
       
            SegmentedListRowView()
            
            Spacer()
        }
        
        
        
    }
        

}


#Preview {
    SegmentedTabView()
        .environmentObject(NewsViewModel())
}
