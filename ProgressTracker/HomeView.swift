//
//  HomeView.swift
//  ProgressTracker
//
//  Created by Miguel Quezada on 22-06-22.
//

import CoreData
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.title, ascending: true)], predicate: NSPredicate(format: "closed = false")) var projects: FetchedResults<Project>

    
    static let tag: String? = "Home"
    let items: FetchRequest<Item>
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "completed = false")

        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Item.priority, ascending: false)
        ]

        request.fetchLimit = 10
        items = FetchRequest(fetchRequest: request)

    }
    var projectRows: [GridItem] {
        [GridItem(.fixed(100))]
    }


    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: projectRows) {
                            ForEach(projects, content: ProjectSummaryView.init)
                        
                        }
                        .padding([.horizontal, .top])
                        .fixedSize(horizontal: false, vertical: true)


                    }
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            ItemListView(title: "Up next", items: items.wrappedValue.prefix(3))
                            ItemListView(title: "More to explore", items: items.wrappedValue.dropFirst(3))
                        }
                    }
                    .padding(.horizontal)

                }

            }
            .background(Color.systemGroupedBackground.ignoresSafeArea())
            .navigationTitle("Home")
        }
    }
    
    

}
// Keep for testing
//Button("Add Data") {
//    dataController.deleteAll()
//    dataController.save()
//    try? dataController.createSampleData()
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
