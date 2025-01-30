//
//  TodoSwiftApp.swift
//  TodoSwift
//
//  Created by Albert Shkhyan on 31.01.25.
//

import SwiftUI

@main
struct TodoSwiftApp: App {
    init() {// This is like constructor
        print("✅ Hello, World! SwiftUI app is launching...") // N:1
    }

    // Defines the UI structure
    var body: some Scene {// this like render()
        WindowGroup {// This like react-router - React Router for Multi-Screen Apps
            ContentView()
                .onAppear {// this like componentDidMount
                    print("📌 ContentView has appeared!")// N: 4
                }
        }
    }
}
