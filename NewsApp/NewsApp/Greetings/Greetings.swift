//
//  Greeting.swift
//  NewsApp
//
//  Created by Marvin John on 26.07.24.
//

import Foundation

enum Greetings{
    case morning
    case afternoon
    case evening 
    
    var message: String{
        switch self{
        case .morning: return "Good morning"
        case .afternoon: return "Welcome"
        case .evening: return "Good evening"
        }
    }
}

func getGreeting(for date: Date) -> Greetings{
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    
    switch hour {
    case 0..<12:
        return .morning
    case 12..<18:
        return .afternoon
    default:
        return .evening
        
    }
}

let now = Date()
let currentGreeting = getGreeting(for: now)
