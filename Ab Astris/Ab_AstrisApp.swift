//
//  Ab_AstrisApp.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

@main
struct Ab_AstrisApp: App {
    @AppStorage("onboarded") private var onboarded: Bool = false
    
    var body: some Scene {
        WindowGroup {
//            if onboarded {
                ContentView()
//            }
//            else {
//                OnboadingView()
//            }
        }
    }
}
