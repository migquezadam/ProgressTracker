//
//  ProgressTrackerApp.swift
//  ProgressTracker
//
//  Created by Miguel Quezada on 21-06-22.
//

import SwiftUI

@main
struct ProgressTrackerApp: App {
    
    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)

        }
    }
}
