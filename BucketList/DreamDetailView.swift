//
//  DreamDetailView.swift
//  BucketList
//
//  Created by Kiran Shrestha on 1/22/26.
//

import SwiftUI
import SwiftData

struct DreamDetailView: View {
    @State var dream : Dream
    
    @State private var goal : String = ""
    @State private var notes : String = ""
    @State private var completed : Bool = false
    @State private var completionDate : Date = Date.now
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    init(dream: Dream) {
        self.dream = dream
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Goal:")
            TextField("goal", text: $goal)
                .textFieldStyle(.roundedBorder)
            Text("Notes:")
            TextField("notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            //TODO: How to allow multi like text box?
            
            Toggle("Completed:", isOn: $completed)
            if completed {
                DatePicker("Completed on:", selection: $completionDate, displayedComponents: .date)
            }
            Spacer()
        }
        .font(.title2)
        .fontWeight(.bold)
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dream.goal = goal
                    dream.notes = notes
                    dream.completed = completed
                    dream.completionDate = completionDate
                    modelContext.insert(dream)
                    try? modelContext.save()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }
                
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                
            }
        }
        .onAppear {
            self.goal = dream.goal
            self.notes = dream.notes
            self.completed = dream.completed
            self.completionDate = dream.completionDate
        }
    }
}

#Preview {
    NavigationStack {
        DreamDetailView(dream: Dream())
    }
}
