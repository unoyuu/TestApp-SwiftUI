//
//  APIError.swift
//  TestApp-SwiftUI
//
//  Created by 宇野佑 on 2023/05/13.
//

import Foundation

enum APIError:Error{
    case invalidURL
    case networkError
    case noneValue
    case unknown
    
    var title:String{
        switch self{
        case.noneValue:
            return "値が空で取得されたエラー"
        case .invalidURL:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        default:
            return "不明なエラー"
        }
    }
}
