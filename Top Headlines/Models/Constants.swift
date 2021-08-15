//
//  Constants.swift
//  Constants
//
//  Created by Frank Bara on 8/13/21.
//

import Foundation

// https://newsapi.org/v2/top-headlines?country=us&apiKey=b33cf57744d1460c89d3f13659920d13
enum Constants {
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    static let country = "us"
    static let apiKey = "b33cf57744d1460c89d3f13659920d13"
    static var endPoint: String {
        Self.baseURL + "?country=" + self.country + "&apiKey=" + Self.apiKey
    }
}
