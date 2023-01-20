//
//  HomeView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var yesterdayHoroscope = Horoscope(sign: UserDefaults.standard.object(forKey: "sign") as! String, day: "yesterday")
    @StateObject var todayHoroscope = Horoscope(sign: UserDefaults.standard.object(forKey: "sign") as! String, day: "today")
    @StateObject var tomorrowHoroscope = Horoscope(sign: UserDefaults.standard.object(forKey: "sign") as! String, day: "tomorrow")
    @State var selection = 2
    @State var today = "Today"
    @State var yesterday = "Yesterday"
    @State var tomorrow = "Tomorrow"
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(todayHoroscope.symbol)
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(0)
                Text("ab astris")
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(0)
                Text(todayHoroscope.symbol)
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(0)
            }
            
            Text("*~from the stars~*")
                .foregroundColor(Color.black)
                .padding(0)
            
            TabView(selection: $selection) {
                VStack {
                    HoroscopeCardView(header: self.$yesterday)
                        .environmentObject(yesterdayHoroscope)
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .padding()
                    }
                }
                .tag(1)
                
                VStack {
                    HoroscopeCardView(header: self.$today)
                        .environmentObject(todayHoroscope)
                    HStack {
                        Image(systemName: "arrow.left")
                            .padding()
                        Spacer()
                        Image(systemName: "arrow.right")
                            .padding()
                    }
                }
                .tag(2)

                VStack {
                    HoroscopeCardView(header: self.$tomorrow)
                        .environmentObject(tomorrowHoroscope)
                        .tag(3)
                    HStack {
                        Image(systemName: "arrow.left")
                            .padding()
                        Spacer()
                    }
                }
                .tag(3)
            }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear(perform: {self.selection = 2})
                .padding([.top], 0)
            Spacer()
        }
    }
}
