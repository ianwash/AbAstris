//
//  Horoscope.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/17/23.
//

import Foundation

class Horoscope: ObservableObject {
    let helper = HelperFunctions()
    // announce when the changes occur, re-renders any view that relies on the data
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
                // TK for further error handling in the future
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
                    self.compSymbol = self.helper.getMatchingSymbol(sign: self.compatibility)
                    self.symbol = self.helper.getMatchingSymbol(sign: sign)
                }
            }
            // catch error if unable to decode to JSON
            catch {
                // TK for futher error handling in future
                return
            }
        }
        task.resume()
    }
}
