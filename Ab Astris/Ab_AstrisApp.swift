//
//  Ab_AstrisApp.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

@main
struct Ab_AstrisApp: App {
    // keeps track of onboarded status in user defaults
    @AppStorage("onboarded") private var onboarded: Bool = false
    @State private var birthDate = Date.now
    let userDefaults = UserDefaults.standard
    let helper = HelperFunctions()
    
    var body: some Scene {
        WindowGroup {
            if onboarded {
                ContentView()
            }
            else {
                VStack {
                    Text("ab astris")
                        .foregroundColor(Color.black)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .padding(0)
                    Text("*~from the stars~*")
                        .foregroundColor(Color.black)
                        .font(.system(size: 30))
                        .padding(0)
                    Spacer()
                            .frame(height: 100)
                    Text("Enter your birthday.")
                    HStack {
                        DatePicker("", selection: $birthDate, displayedComponents: .date)
                            .labelsHidden()
                        Button {
                            makeUser()
                        } label: {
                            Image(systemName: "arrow.right.circle")
                                .foregroundColor(Color.black)
                                .font(.system(size: 25))
                        }

                    }
                }
            }
        }
    }
    func makeUser() {
        userDefaults.set(String(helper.getSign(birthDate: birthDate)), forKey: "sign")
        onboarded = true
    }
}
