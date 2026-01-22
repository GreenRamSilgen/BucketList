//
//  DreamListView.swift
//  BucketList
//
//  Created by Kiran Shrestha on 1/22/26.
//

import SwiftUI
import SwiftData

struct DreamListView: View {
    let filterType : FilterBL
    @Query var dreams : [Dream]
    
    @Environment(\.modelContext) var modelContext
    
    init(_ filter : FilterBL) {
        self.filterType = filter
        switch self.filterType {
        case .all:
            _dreams = Query()
        case .completed:
            _dreams = Query(filter: #Predicate {$0.completed })
        case .incomplete:
            _dreams = Query(filter: #Predicate {!$0.completed })
        }
    }
    
    var body: some View {
        List(dreams) { dream in
            NavigationLink {
                DreamDetailView(dream: dream)
            } label: {
                Image(systemName: dream.completed ? "checkmark.square" : "square")
                    .onTapGesture {
                        dream.completed.toggle()
                    }
                Text(dream.goal)
            }
            .swipeActions {
                Button(role: .destructive) {
                    modelContext.delete(dream)
                    try? modelContext.save()
                } label: {
                    Image(systemName: "trash")
                }

            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    DreamListView(.all)
}
