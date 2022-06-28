//
//  HomeView.swift
//  ProgressTracker
//
//  Created by Miguel Quezada on 22-06-22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    static let tag: String? = "Home"

    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data") {
                    dataController.deleteAll()
                    dataController.save()
                    try? dataController.createSampleData()
                }
                
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
