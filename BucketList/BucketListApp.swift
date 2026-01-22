//
//  BucketListApp.swift
//  BucketList
//
//  Created by Kiran Shrestha on 1/22/26.
//

import SwiftUI
import SwiftData

@main
struct BucketListApp: App {
    var body: some Scene {
        WindowGroup {
            BucketListView()
                .modelContainer(for: Dream.self)
        }
    }
}
