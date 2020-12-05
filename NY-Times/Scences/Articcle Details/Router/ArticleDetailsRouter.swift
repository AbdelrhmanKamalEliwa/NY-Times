//
//  ArticleDetailsRouter.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import UIKit

class ArticleDetailsRouter {
    class func createArticleDetailsVC(_ articleData: Result) -> UIViewController {
        let articleDetailsVC = ArticleDetailsVC(navBarTitle: .ArticleDetails)
        let router = ArticleDetailsRouter()
        let presenter = ArticleDetailsVCPresenter(
            view: articleDetailsVC,
            router: router,
            articleData: articleData)
        articleDetailsVC.presenter = presenter
        return articleDetailsVC
    }
}
