//
//  AddFriendSheet.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/19/23.
//

import SwiftUI

struct AddFriendSheet: View {
    // allows sheet to dismiss itself
    @Environment(\.dismiss) var dismiss
    
    @State private var isPresentingConfirm: Bool = false
    @State var birthDate = Date()
    @State var name = ""
    @State var friends = UserDefaults.standard.object(forKey: "friends") as? [String] ?? []
    
    let helper = HelperFunctions()
    
    var body: some View {
        VStack {
            Spacer()
            
            // limits number of friends to 10
            if friends.count <= 10 {
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(Color.black)
                    .font(.system(size: 70))
                Text("Add a star.")
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding()
                TextField(
                    "Enter their name.",
                    text: $name
                )
                .padding([.leading, .trailing], 20)
                
                DatePicker("Enter their birthday.", selection: $birthDate, displayedComponents: .date)
                    .padding([.leading, .trailing], 20)
                
                Button {
                    if name == "" {
                        return
                    }
                    isPresentingConfirm.toggle()
                } label: {
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(Color.black)
                            .font(.system(size: 20))
                        Text("Confirm")
                            .foregroundColor(Color.black)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                .confirmationDialog("Are you sure?",
                                    isPresented: $isPresentingConfirm) {
                    Button("Confirm") {
                        addFriend()
                    }
                }
            }
            
            else {
                Text("You have added the max number of friends.")
            }
            
            Spacer()
        }
    }
    
    func addFriend() {
        let sign = helper.getSign(birthDate: birthDate)
        // accounts for spaces in name, only will take first part
        name = name.components(separatedBy: " ")[0]
        friends.append("\(sign) \(name)")
        UserDefaults.standard.set(friends, forKey: "friends")
        name = ""
        birthDate = Date()
        dismiss()
    }
}
