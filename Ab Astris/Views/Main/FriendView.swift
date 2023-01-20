//
//  FriendView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

struct FriendView: View {
    @State var friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
    @State var showingSheet = false
    @State var birthDate = Date()
    @State var name = ""
    @State var friendHoroscopeSheet = false
    @State var todayHoroscope = Horoscope(sign: "Pisces", day: "Today")
    @State var selectedName: String = ""
    let helper = HelperFunctions()
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Friends")
                    .foregroundColor(Color.black)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.black)
                        .font(.system(size: 30))
                        .padding()
                }
                .sheet(isPresented: $showingSheet) {
                    VStack {
                        Spacer()
                        if friends.count <= 10 {
                            Text("Add a friend")
                                .foregroundColor(Color.black)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(0)
                            TextField(
                                "Enter their name.",
                                text: $name
                            )
                            .padding([.leading, .trailing], 20)
                            DatePicker("Enter their birthday.", selection: $birthDate, displayedComponents: .date)
                                .padding([.leading, .trailing], 20)
                            Button {
                                addFriend()
                            } label: {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 30))
                                    .padding()
                            }

                        }
                        else {
                            Text("You have added the max number of friends.")
                        }
                        Spacer()
                    }
                }
            }
            VStack {
                if friends.count == 0 {
                    Spacer()
                    Text("You haven't saved any friends yet.")
                    Spacer()
                }
                else {
                    ScrollView {
                        // display the friends
                        ForEach(friends, id: \.self) { friend in
                            Button {
                                let components = friend.components(separatedBy: " ")
                                selectedName = components[1] + "'s Day"
                                todayHoroscope = Horoscope(sign: components[0], day: "today")
                                friendHoroscopeSheet.toggle()
                            } label: {
                                FriendCardView(info: friend)
                            }
                        }
                        .sheet(isPresented: $friendHoroscopeSheet) {
                            HoroscopeCardView(header: self.$selectedName)
                                .environmentObject(todayHoroscope)
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    func addFriend() {
        let sign = helper.getSign(birthDate: birthDate)
        friends.append("\(sign) \(name)")
        UserDefaults.standard.set(friends, forKey: "friends")
        name = ""
        birthDate = Date()
        showingSheet = false
    }
}
