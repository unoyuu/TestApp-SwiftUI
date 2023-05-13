//
//  ArticleViewModel.swift
//  TestApp-SwiftUI
//
//  Created by 宇野佑 on 2023/05/13.
//

import Foundation

final class ArticleViewModel: ObservableObject{
    @Published var article:[Article] = [Article]()
    private let articleAPIClient = ArticleListAPIClient()
    
    init(){
        loadArticles()
    }
    
    private func loadArticles(){
        articleAPIClient.fech(completion: { result in
            switch result {
            case .success(let articleList):
                self.article = articleList
                
            case .failure(let error):
                print(error.title)
            }
        })
    }
}
