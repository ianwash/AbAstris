//
//  HoroscopeCardView.swift
//  Ab Astris
//
//  Created by Ian Washabaugh on 1/18/23.
//

import SwiftUI

struct HoroscopeCardView: View {
    @EnvironmentObject var horoscope: Horoscope
    var day: String
    var width = UIScreen.main.bounds.width - 60
    var height = UIScreen.main.bounds.height - 280
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(day)
                        .foregroundColor(Color.white)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding([.leading], 15)
                    
                    Spacer()
                    
                    ShareLink(item: horoscope.description) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20))
                            .padding([.trailing], 25)
                            .padding([.bottom], 2)
                    }
                }
                .padding([.bottom], 0)
                
                HStack {
                    Text("\(horoscope.current_date)")
                        .foregroundColor(Color.white)
                        .padding([.leading], 15)
                    
                    Spacer()
                }
                
                Text("\(horoscope.description)")
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("Most Compatible: \(horoscope.compatibility)")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding([.bottom], 0)
                
                Group {
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(Color.white)
                                    .padding([.leading], 25)
                                    .padding([.bottom], 2)
                                Text("\(horoscope.lucky_time)")
                                    .foregroundColor(Color.white)
                                    .padding([.bottom], 5)
                                Spacer()
                            }
                            
                            
                            HStack {
                                Image(systemName: "number.circle")
                                    .foregroundColor(Color.white)
                                    .padding([.leading], 25)
                                    .padding([.bottom], 2)
                                Text("\(horoscope.lucky_number)")
                                    .foregroundColor(Color.white)
                                    .padding([.bottom], 2)
                                Spacer()
                            }
                            
                            HStack {
                                Image(systemName: "paintpalette")
                                    .foregroundColor(Color.white)
                                    .padding([.leading], 25)
                                    .padding([.bottom], 2)
                                Text("\(horoscope.color)")
                                    .foregroundColor(Color.white)
                                    .padding([.bottom], 2)
                                Spacer()
                            }
                            
                            
                            HStack {
                                Image(systemName: "face.smiling")
                                    .foregroundColor(Color.white)
                                    .padding([.leading], 25)
                                    .padding([.bottom], 2)
                                Text("\(horoscope.mood)")
                                    .foregroundColor(Color.white)
                                    .padding([.bottom], 2)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        Text(horoscope.compSymbol)
                            .foregroundColor(Color.white)
                            .font(.system(size: 140))
                            .fontWeight(.bold)
                            .padding([.trailing], 25)
                    }
                }
            }
        }
        .frame(width: width, height: height)
        .clipped()
        .cornerRadius(20)
    }
}
