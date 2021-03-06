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
