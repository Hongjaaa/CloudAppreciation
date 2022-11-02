//
//  CloudAppreciationApp.swift
//  CloudAppreciation
//
//  Created by 최홍준 on 2022/08/23.
//

import SwiftUI

@main
struct CloudAppreciationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
