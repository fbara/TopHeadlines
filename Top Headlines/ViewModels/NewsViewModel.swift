//
//  NewsViewModel.swift
//  NewsViewModel
//
//  Created by Frank Bara on 8/13/21.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [ArticleViewModel] = []
    @Published var isLoading = false
    
    func getNews() {
        isLoading = true
        if #available(iOS 15, *) {
            Task.init {
                do {
                let news: News = try await APIService.shared.getJSON(urlString: Constants.endPoint, dateDecodingStrategy: .iso8601)
                    print(Thread.current)
                    articles = news.articles.map(ArticleViewModel.init)
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                }
            }
        } else {
            
            APIService.shared.getJSON(urlString: Constants.endPoint, dateDecodingStrategy: .iso8601) { (result: Result<News, APIService.APIError>) in
                        switch result {
                        case .success(let news):
                            DispatchQueue.main.sync {
                                self.articles = news.articles.map(ArticleViewModel.init)
                                self.isLoading = false
                            }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        }
        
        
    }
}
