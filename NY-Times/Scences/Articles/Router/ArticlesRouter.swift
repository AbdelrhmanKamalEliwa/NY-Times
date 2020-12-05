//
//  ArticlesRouter.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import UIKit

class ArticlesRouter {
    class func createArticlesVC() -> UIViewController {
        let articlesVC = ArticlesVC(navBarTitle: .Articles)
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        let presenter = ArticlesVCPresenter(view: articlesVC, interactor: interactor, router: router)
        articlesVC.presenter = presenter
        return articlesVC
    }
    
    func navigateToArticleDetailsScreen(from view: ArticlesView?, articleData: Result) {
        let articleDetailsView = ArticleDetailsRouter.createArticleDetailsVC(articleData)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(articleDetailsView, animated: true)
        }
    }
}
