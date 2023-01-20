//
//  ContentView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "person")
                    Text("you")
                }
            
            FriendView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("friends")
                }
        }
    }
}

