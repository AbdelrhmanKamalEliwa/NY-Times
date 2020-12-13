//
//  ArticleDetailsVCPresenter.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import Foundation

// MARK: - ArticleDetailsView Protocol
protocol ArticleDetialsView: class {
    var presenter: ArticleDetailsVCPresenter? { get set }
    func setMedia(imageUrl: String)
}

// MARK: - ArticleDetailsCellView Protocol
protocol ArticleDetailsCellView {
    func displayContent(_ title: String)
}

// MARK: - MediaCellView Protocol
protocol MediaCellView {
    func displayLogo(_ imageUrl: String?)
}

class ArticleDetailsVCPresenter {
    // MARK: - Properties
    private weak var view: ArticleDetialsView?
    private let router: ArticleDetailsRouter
    private var articleData: Result
    private let titlesData = ArticleDetails().data
    
    // MARK: - Init
    init(view: ArticleDetialsView?, router: ArticleDetailsRouter, articleData: Result) {
        self.view = view
        self.router = router
        self.articleData = articleData
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        setImage()
    }
    
    private func setImage() {
        if let articleMedia = articleData.media, !articleMedia.isEmpty {
            if let mediaMetadata = articleMedia[0].mediaMetadata, !articleMedia.isEmpty {
                view?.setMedia(imageUrl: mediaMetadata[2].url)
            }
        }
    }
    
    func numberOfSections() -> Int { titlesData.count }
    
    func numberOfRowInSection() -> Int { 1 }
    
    func titleForHeaderInSection(for section: Int) -> String {
        titlesData[section]
    }
    
    func articleDetailsCellConfiguration(_ cell: ArticleDetailsCellView, for section: Int) {
        switch section {
        case 0:
            cell.displayContent(articleData.title ?? "None")
        case 1:
            cell.displayContent(articleData.abstract ?? "None")
        case 2:
            cell.displayContent(articleData.byline ?? "None")
        default:
            return
        }
    }
}
