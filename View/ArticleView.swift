//
//  ArticleView.swift
//  TestApp-SwiftUI
//
//  Created by 宇野佑 on 2023/05/13.
//

import SwiftUI

struct Article:Codable{
    let title:String
}

struct ArticleView: View {
    @ObservedObject private var viewModel = ArticleViewModel()

    var body: some View {
        VStack{
            
            List{
                ForEach(0..<viewModel.article.count,id: \.self) { index in
                    Text(viewModel.article[index].title)
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
