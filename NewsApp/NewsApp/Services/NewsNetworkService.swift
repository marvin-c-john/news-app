//
//  NewsNetworkService.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//
//

import Foundation

class NewsNetworkService {
    
    private let baseUrl = "https://newsapi.org/v2"
    private let baseUrl2 = "https://content.guardianapis.com"
    private let apiKey = "cbe3d50f483f45f4907f6c77a49eec3a"
    private let apiKey2 = "a240bcf7-8ed3-4884-87d4-4a003af9b2c1"
    static let shared = NewsNetworkService()
    
    private var formattedDate: String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDate)
    }

   
    
    private init() {}
    
    func getBreakingNews() async throws -> [Article] {
        guard var urlComponents = URLComponents(string: baseUrl + "/top-headlines") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "sources", value: "bbc-news"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(Articles.self, from: data)
            return responseObject.articles
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    func getBusinessNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "business"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate)
            
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    
    func getTechNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "technology"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    
    func getScienceNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "science"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    
    func getSportNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "sport"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate),
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }

    
    func getCultureNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "culture"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }

    
    
    
    func getMusicNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "music"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate),
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    
    func getAllNews() async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "section", value: "news"),
            URLQueryItem(name: "q", value: "US"),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "to-date", value: formattedDate)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }
    
    
    func searchNews(query: String) async throws -> [GArticle] {
        guard var urlComponents = URLComponents(string: baseUrl2 + "/search?") else {
            throw Errors.invalidResponse
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "api-key", value: apiKey2),
            URLQueryItem(name: "show-fields", value: "thumbnail,body"),
            URLQueryItem(name: "from-date", value: formattedDate)
        ]
        
        guard let url = urlComponents.url else {
            throw Errors.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print("Searched data: \(String(decoding: data, as: UTF8.self))")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(GArticlesResponse.self, from: data)
            return responseObject.response.results
            
        } catch {
            throw Errors.netWorkError(error)
        }
    }

}
