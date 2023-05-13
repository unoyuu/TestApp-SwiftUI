//
//  ArticleListAPIClient.swift
//  TestApp-SwiftUI
//
//  Created by 宇野佑 on 2023/05/13.
//

import Foundation

class ArticleListAPIClient:ArticleListAPIClientProtocol{
    func fech(completion: @escaping ((Result<[Article],APIError>) -> Void)) {
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            return completion(.failure(.invalidURL))
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            
            do{
                guard let data = data else { throw APIError.networkError }
                guard let articleList = try? JSONDecoder().decode([Article].self, from: data) else{
                    throw APIError.noneValue
                }
                
                DispatchQueue.main.async {
                    completion(.success(articleList))
                }
            }catch{
                if error as? APIError == APIError.networkError {
                    completion(.failure(.networkError))
                } else if error as? APIError == APIError.noneValue {
                    completion(.failure(.noneValue))
                } else {
                    completion(.failure(.unknown))
                }
            }
            
        }.resume()
    }
}
