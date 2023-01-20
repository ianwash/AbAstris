//
//  HelperFunctions.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/19/23.
//

import Foundation

struct HelperFunctions {
    func getSign(birthDate: Date) -> String{

        let c = Calendar.current
        let day = c.component(.day, from: birthDate)
        let month = c.component(.month, from: birthDate)

        // takes the date ranges that span months, dates are inclusive
        switch (day, month) {
        case (20...31,1),(1...18,2):
            return "Aquarius"
        case (19...29,2),(1...20,3):
            return "Pisces"
        case (21...31,3),(1...19,4):
            return "Aries"
        case (20...30,4),(1...20,5):
            return "Taurus"
        case (21...31,5),(1...20,6):
            return "Gemini"
        case (21...30,6),(1...22,7):
            return "Cancer"
        case (23...31,7),(1...22,8):
            return "Leo"
        case (23...31,8),(1...22,9):
            return "Virgo"
        case (23...30,9),(1...22,10):
            return "Libra"
        case (23...31,10),(1...21,11):
            return "Scorpio"
        case (22...30,11),(1...21,12):
            return "Sagittarius"
        default:
            return "Capricorn"
        }
    }
    
    func getMatchingSymbol(sign: String) -> String {
        let h = ["Aquarius": "♒︎", "Pisces": "♓︎", "Aries": "♈︎", "Taurus": "♉︎", "Capricorn": "♑︎", "Cancer": "♋︎", "Sagittarius": "♐︎", "Virgo": "♍︎", "Gemini": "♊︎", "Leo": "♌︎", "Scorpio": "♏︎", "Libra": "♎︎"]
        return h[sign] ?? ""
    }
}
