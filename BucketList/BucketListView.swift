//
//  BucketListView.swift
//  BucketList
//
//  Created by Kiran Shrestha on 1/22/26.
//

import SwiftUI
import SwiftData

enum FilterBL: String, CaseIterable {
    case all = "All"
    case completed = "Completed"
    case incomplete = "Open"
}

struct BucketListView: View {
    @State private var selectedFilter : FilterBL = .all
    @State private var isDreamDetailShown : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $selectedFilter) {
                    ForEach(FilterBL.allCases, id: \.self) { filter in
                        Text(filter.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                DreamListView(selectedFilter)
            }
            .navigationTitle("Bucket List:")
            .toolbar {
                Button {
                    isDreamDetailShown = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .fullScreenCover(isPresented: $isDreamDetailShown) {
                NavigationStack{
                    DreamDetailView(dream: Dream())
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        BucketListView()
            .modelContainer(Dream.preview)
    }
}
