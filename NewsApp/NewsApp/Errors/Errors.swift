//
//  Errors.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import Foundation

enum Errors: Error, LocalizedError{
    case netWorkError(Error)
    case invalidResponse
    case decodingError(Error)
    case unknownError
    
    var errorDescription: String?{
        switch self {
        case .netWorkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from the server"
        case .decodingError(let error):
            return "Deconding error: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occured"
        }
    }
}
