//
//  Dream.swift
//  BucketList
//
//  Created by Kiran Shrestha on 1/22/26.
//

import Foundation
import SwiftData

@Model
class Dream {
    var goal : String = ""
    var notes : String = ""
    var completed : Bool = false
    var completionDate : Date = Date.now
    
    init(goal: String = "", notes: String = "", completed: Bool = false, completionDate: Date = Date.now) {
        self.goal = goal
        self.notes = notes
        self.completed = completed
        self.completionDate = completionDate
    }
}

extension Dream {
    @MainActor
    static var preview : ModelContainer {
        let container = try! ModelContainer(for: Dream.self, configurations: ModelConfiguration( isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Dream(goal: "IOS", notes: "Become an ios developer", completed: false, completionDate: Date.now))
        container.mainContext.insert(Dream(goal: "5k Run", notes: "Complete a 5k run at xyz location", completed: true, completionDate: Date.now - (60*60*48)))
        
        return container
    }
}
