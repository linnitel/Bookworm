//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Julia Martcenko on 23/02/2025.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: Book.self)
    }
}
