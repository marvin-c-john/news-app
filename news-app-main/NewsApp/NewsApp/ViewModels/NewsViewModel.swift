//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Marvin John on 23.07.24.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var selectedFilter: Segmented = .all
    @Published var articles: [Article] = []
    @Published var businessArticles: [GArticle] = []
    @Published var techArticles: [GArticle] = []
    @Published var scienceArticles: [GArticle] = []
    @Published var sportArticles: [GArticle] = []
    @Published var cultureArticles: [GArticle] = []
    @Published var musicArticles: [GArticle] = []
    @Published var allArticles: [GArticle] = []
    @Published var searchedArticles: [GArticle] = []
    @Published var savedArticles: [GArticle] = []
    @Published var newItem: [GArticle] = [
        GArticle(webPublicationDate: "", webTitle: "", fields: .init(thumbnail: "", body: ""))
    ]
    @Published var query: String = ""
    @Published var saved = false
    let html = ""
  
    
    
    
    init()  {
        fetchBreakingNews()
        fetchBusinessNews()
        fetchTechNews()
        fetchScienceNews()
        fetchSportNews()
        fetchCultureNews()
        fetchMusicNews()
        fetchAllNews()
    }
    
    func fetchBreakingNews() {
        Task {
            do {
                let articles = try await NewsNetworkService.shared.getBreakingNews()
                DispatchQueue.main.async {
                    self.articles = articles
                }
            } catch {
                print("Failed to fetch articles: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchBusinessNews() {
        Task {
            do {
                let businessArticles = try await NewsNetworkService.shared.getBusinessNews()
                DispatchQueue.main.async {
                    self.businessArticles = businessArticles
                }
            } catch {
                print("Failed to fetch Business articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    func fetchTechNews() {
        Task {
            do {
                let techArticles = try await NewsNetworkService.shared.getTechNews()
                DispatchQueue.main.async {
                    self.techArticles = techArticles
                }
            } catch {
                print("Failed to fetch Tech articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    func fetchScienceNews() {
        Task {
            do {
                let scienceArticles = try await NewsNetworkService.shared.getScienceNews()
                DispatchQueue.main.async {
                    self.scienceArticles = scienceArticles
                }
            } catch {
                print("Failed to fetch Science articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    func fetchSportNews() {
        Task {
            do {
                let sportArticles = try await NewsNetworkService.shared.getSportNews()
                DispatchQueue.main.async {
                    self.sportArticles = sportArticles
                }
            } catch {
                print("Failed to fetch Sport articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    func fetchCultureNews() {
        Task {
            do {
                let cultureArticles = try await NewsNetworkService.shared.getCultureNews()
                DispatchQueue.main.async {
                    self.cultureArticles = cultureArticles
                }
            } catch {
                print("Failed to fetch Culture articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    func fetchMusicNews() {
        Task {
            do {
                let musicArticles = try await NewsNetworkService.shared.getMusicNews()
                DispatchQueue.main.async {
                    self.musicArticles = musicArticles
                }
            } catch {
                print("Failed to fetch Health articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    func fetchAllNews() {
        Task {
            do {
                let allArticles = try await NewsNetworkService.shared.getAllNews()
                DispatchQueue.main.async {
                    self.allArticles = allArticles
                }
            } catch {
                print("Failed to fetch Health articles: \(error.localizedDescription)")
            }
        }
    }
    
    
    func searchArticles() {
        Task {
            do {
                let searchedArticles = try await NewsNetworkService.shared.searchNews(query: query)
                DispatchQueue.main.async {
                    self.searchedArticles = searchedArticles
                  
                }
            } catch {
                print("Failed to Search articles: \(error.localizedDescription)")
            }
        }
    }
  
    
    
//     Function to convert HTML to text
    func htmlToString(_ html: String) -> String {
        let data = Data(html.utf8)
        if let attributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ) {
            return attributedString.string
        }
        return html
    }
    
    
    
    func addArticle(title: String, image: String?, description: String?) {
        let newArticle =  GArticle(webPublicationDate: "", webTitle: title, fields: .init(thumbnail: image, body: description))
        savedArticles.append(newArticle)
    }
    
    
    
    func removeArticle(at offsets: IndexSet) {
          savedArticles.remove(atOffsets: offsets)
      }
 
    
    func setupAppearance() {
      UIPageControl.appearance().currentPageIndicatorTintColor = .savoyBlue
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}
