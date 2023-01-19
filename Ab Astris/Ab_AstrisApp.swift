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
                        DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: .date)
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
        userDefaults.set(String(getSign()), forKey: "sign")
        userDefaults.set([], forKey: "friends")
        print("here!")
        print(UserDefaults.standard.object(forKey: "sign"))
        onboarded = true
    }
    
    func getSign() -> String{

        let c = Calendar.current
        let day = c.component(.day, from: birthDate)
        let month = c.component(.month, from: birthDate)

        // takes the date ranges that span months, dates are inclusive
        switch (day, month) {
        case (21...31,1),(1...19,2):
            return "Aquarius"
        case (20...29,2),(1...20,3):
            return "Pisces"
        case (21...31,3),(1...20,4):
            return "Aries"
        case (21...30,4),(1...21,5):
            return "Taurus"
        case (22...31,5),(1...21,6):
            return "Gemini"
        case (22...30,6),(1...22,7):
            return "Cancer"
        case (23...31,7),(1...22,8):
            return "Leo"
        case (23...31,8),(1...23,9):
            return "Virgo"
        case (24...30,9),(1...23,10):
            return "Libra"
        case (24...31,10),(1...22,11):
            return "Scorpio"
        case (23...30,11),(1...21,12):
            return "Sagittarius"
        default:
            return "Capricorn"
        }
    }
}
