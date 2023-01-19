//
//  User.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import Foundation

class User {
    var sign: String
    var friends: [String]
    
    init(sign: String) {
        self.sign = sign
        self.friends = []
    }
}
