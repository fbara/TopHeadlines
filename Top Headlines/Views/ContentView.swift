//
//  ContentView.swift
//  Top Headlines
//
//  Created by Frank Bara on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        List(viewModel.articles) { article in
            VStack(alignment: .leading) {
                Group {
                    Text(article.source).fontWeight(.bold)
                    Text(article.author)
                    Text(article.date)
                }
                .font(.caption)
                Text(article.title).fontWeight(.bold)
                Text(article.description)
                    .foregroundColor(Color.secondary)
                
                HStack {
                    Spacer()
                    Link(destination: article.url, label: {
                        Image(systemName: "globe")
                            .font(.system(size: 36))
                            .foregroundColor(.gray)
                    })
                }
            }
        }
        .onAppear {
            viewModel.getNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
