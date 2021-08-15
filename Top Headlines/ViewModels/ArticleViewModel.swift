//
//  ArticleViewModel.swift
//  ArticleViewModel
//
//  Created by Frank Bara on 8/14/21.
//

import Foundation
import UIKit

struct ArticleViewModel: Identifiable {
    let article: News.Article
    init(article: News.Article) {
        self.article = article
    }
    
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    let id = UUID()
    var author: String {
        article.author ?? ""
    }
    
    var url: URL {
        article.url
    }
    
    var source: String {
        article.source.name
    }
    
    var title: String {
        article.title
    }
    
    var description: String {
        article.description ?? ""
    }
    
    var image: UIImage? {
        guard let imageURL = article.urlToImage else { return nil }
        guard let data = try? Data(contentsOf: imageURL) else { return nil }
        guard let image: UIImage = UIImage(data: data) else { return nil }
        return image
    }
    
    var date: String {
        Self.dateFormatter.string(from: article.publishedAt)
    }
}
