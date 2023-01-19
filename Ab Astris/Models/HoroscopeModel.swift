//
//  HoroscopeModel.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import Foundation

struct HoroscopeModel: Codable {
    var current_date: String
    var compatibility: String
    var lucky_time: String
    var lucky_number: String
    var color: String
    var date_range: String
    var mood: String
    var description: String
}
