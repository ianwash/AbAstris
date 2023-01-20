//
//  FocusedFriendSheet.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/19/23.
//

import SwiftUI

struct FocusedFriendSheet: View {
    // allows sheet to dismiss itself
    @Environment(\.dismiss) var dismiss
    
    @Binding var friend: String
    
    @State private var isPresentingConfirm: Bool = false
    @State var friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
    
    // default before is changed in the on appear
    @State var todayHoroscope = Horoscope(sign: "Pisces", day: "today")
    @State var selectedName = ""
    
    var body: some View {
        VStack {
            HoroscopeCardView(header: self.$selectedName)
                .environmentObject(todayHoroscope)
            Button {
                isPresentingConfirm = true
                
            } label: {
                HStack {
                    Text("Remove Friend")
                        .foregroundColor(Color.red)
                        .font(.system(size: 16))
                }
                .padding()
            }
            .confirmationDialog("Are you sure?",
                                isPresented: $isPresentingConfirm) {
                Button("Confirm", role: .destructive) {
                    deleteFriend(friend: friend)
                }
            }
        }
        .onAppear {
            print(friend)
            let components = friend.components(separatedBy: " ")
            selectedName = components[1] + "'s Day"
            todayHoroscope = Horoscope(sign: components[0], day: "today")
        }
    }
    
    func deleteFriend(friend: String) {
        // $0 is first argument
        friends = friends.filter(){$0 != friend}
        UserDefaults.standard.set(friends, forKey: "friends")
        dismiss()
    }
}
