//
//  Binding-OnChange.swift
//  ProgressTracker
//
//  Created by Miguel Quezada on 29-06-22.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
