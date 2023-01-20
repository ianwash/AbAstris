//
//  FriendView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import SwiftUI

struct FriendView: View {
    // if there is nothing in UserDefaults, make the friends key with empty array
    @State var friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
    @State var showingSheet = false
    @State var friendHoroscopeSheet = false
    @State var selectedFriend: String = ""
    
    let helper = HelperFunctions()
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Constellation")
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
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
                .sheet(isPresented: $showingSheet, onDismiss: {
                    friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
                }) {
                    AddFriendSheet()
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
                                selectedFriend = friend
                                friendHoroscopeSheet.toggle()
                            } label: {
                                FriendCardView(info: friend)
                            }
                        }
                        .sheet(isPresented: $friendHoroscopeSheet, onDismiss: {
                            friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
                        }) {
                            FocusedFriendSheet(friend: $selectedFriend)
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
}
