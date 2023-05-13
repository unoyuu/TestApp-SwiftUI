//
//  ArticleListAPIClientProtocol.swift
//  TestApp-SwiftUI
//
//  Created by 宇野佑 on 2023/05/13.
//

import Foundation
import SwiftUI

protocol ArticleListAPIClientProtocol{
    func fech(completion: @escaping ((Result<[Article],APIError>) -> Void))
}
