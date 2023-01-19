//
//  Horoscope.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import Foundation

class Horoscope: ObservableObject {
    @Published var current_date: String = ""
    @Published var compatibility: String = ""
    @Published var lucky_time: String = ""
    @Published var lucky_number: String = ""
    @Published var color: String = ""
    @Published var date_range: String = ""
    @Published var mood: String = ""
    @Published var description: String = ""
    @Published var compSymbol: String = ""
    @Published var symbol: String = ""
    var h = ["Aquarius": "♒︎", "Pisces": "♓︎", "Aries": "♈︎", "Taurus": "♉︎", "Capricorn": "♑︎", "Cancer": "♋︎", "Sagittarius": "♐︎", "Virgo": "♍︎", "Gemini": "♊︎", "Leo": "♌︎", "Scorpio": "♏︎", "Libra": "♎︎"]
    
    init(sign: String, day: String) {
        fetchHoroscope(sign: sign, day: day)
    }
    
    func fetchHoroscope(sign: String, day: String) {
        // try to build URL, return if cannot be made
        guard let url = URL(string: "https://aztro.sameerkumar.website?sign=\(sign)&day=\(day)") else {
            return
        }
        
        // build request
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        
        // decode to model
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            // makes sure data is there and there is no error
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(HoroscopeModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.current_date = response.current_date
                    self.compatibility = response.compatibility
                    self.lucky_time = response.lucky_time
                    self.lucky_number = response.lucky_number
                    self.color = response.color
                    self.date_range = response.date_range
                    self.mood = response.mood
                    self.description = response.description
                    self.compSymbol = self.getCompHoroscope()
                    self.symbol = self.getSign(sign: sign)
                }
            }
            // catch error if unable to decode to JSON
            catch {
                return
            }
        }
        task.resume()
    }
    
    func getCompHoroscope() -> String {
        return self.h[compatibility] ?? ""
    }
    
    func getSign(sign: String) -> String {
        return self.h[sign] ?? ""
    }
}
