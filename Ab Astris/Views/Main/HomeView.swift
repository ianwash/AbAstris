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
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(todayHoroscope.symbol)
                    .foregroundColor(Color.black)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(0)
                Text("ab astris")
                    .foregroundColor(Color.black)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(0)
                Text(todayHoroscope.symbol)
                    .foregroundColor(Color.black)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(0)
            }
            TabView(selection: $selection) {
                HoroscopeCardView(day: "Yesterday").environmentObject(yesterdayHoroscope)
                    .tag(1)
                HoroscopeCardView(day: "Today").environmentObject(todayHoroscope)
                    .tag(2)
                HoroscopeCardView(day: "Tomorrow").environmentObject(tomorrowHoroscope)
                    .tag(3)
            }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear(perform: {self.selection = 2})
                .padding([.top], 0)
            Spacer()
        }
    }
}
