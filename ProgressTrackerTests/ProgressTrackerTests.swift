//
//  ProgressTrackerTests.swift
//  ProgressTrackerTests
//
//  Created by Miguel Quezada on 14-07-22.
//

import CoreData
import XCTest
@testable import ProgressTracker

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
