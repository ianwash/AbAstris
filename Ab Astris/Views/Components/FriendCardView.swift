//
//  FriendCardView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/19/23.
//

import SwiftUI

struct FriendCardView: View {
    var info: String
    var width = UIScreen.main.bounds.width - 40
    var helper = HelperFunctions()
    @State var sign = ""
    @State var name = ""
    @State var signText = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack {
                Group {
                    Text("\(sign)")
                        .padding([.leading, .trailing], 15)
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                    VStack {
                        HStack {
                            Text("\(name)")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        HStack {
                            Text("*\(signText)*")
                                .font(.system(size: 15))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(width: width, height: 75)
        .clipped()
        .cornerRadius(20)
        .onAppear {
            // break apart the friend data
            let components = info.components(separatedBy: " ")
            signText = components[0]
            name = components[1]
            sign = helper.getMatchingSymbol(sign: signText)
        }
    }
}

