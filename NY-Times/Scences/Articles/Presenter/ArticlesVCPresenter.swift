//
//  ArticleVCPresenter.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

// MARK: - ArticlesView Protocol
protocol ArticlesView: class {
    var presenter: ArticlesVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func scrollToTheTop()
    func showError(error: String)
}

// MARK: - ArticlesCellView Protocol
protocol ArticlesCellView {
    func displayTitle(_ title: String)
    func displaySubtitle(_ subtitle: String)
    func displayDate(_ date: String)
    func displayLogo(_ imageUrl: String?)
}

class ArticlesVCPresenter {
    // MARK: - Properties
    private weak var view: ArticlesView?
    private let interactor: ArticlesInteractor
    private let router: ArticlesRouter
    private var articlesData: [Result] = []
    private var articlesLastDay: [Result] = []
    private var articlesLastWeek: [Result] = []
    private var articlesLastMonth: [Result] = []
    
    // MARK: - Init
    init(view: ArticlesView?, interactor: ArticlesInteractor, router: ArticlesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        fetchData()
    }
    
    private func fetchData(_ period: Int = 1) {
        
        guard articlesLastDay.isEmpty || articlesLastWeek.isEmpty || articlesLastMonth.isEmpty
        else {
            self.view?.fetchDataSuccess()
            return
        }
        
        view?.showIndicator()
        interactor.getArticles(String(period)) { [weak self] (result, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            }
            
            guard let articles = result?.results else {
                self.view?.showError(error: "error")
                return
            }
            
            switch period {
            case 1:
                self.articlesLastDay = articles
                self.articlesData = self.articlesLastDay
            case 7:
                self.articlesLastWeek = articles
                self.articlesData = self.articlesLastWeek
            case 30:
                self.articlesLastMonth = articles
                self.articlesData = self.articlesLastMonth
            default:
                self.articlesData = articles
            }
            
            self.view?.fetchDataSuccess()
        }
    }
    
    func setPeriod(_ segmentedControlIndex: Int) {
        switch segmentedControlIndex {
        case 0:
            fetchData(1)
        case 1:
            fetchData(7)
        case 2:
            fetchData(30)
        default:
            return
        }
        view?.scrollToTheTop()
    }
    
    func numberOfArticles() -> Int { articlesData.count }
    
    func cellConfiguration(_ cell: ArticlesCellView, for index: Int) {
        
        let article = articlesData[index]
        cell.displayTitle(article.title ?? "")
        cell.displaySubtitle(article.byline ?? "")
        cell.displayDate(article.publishedDate ?? "")
        
        if let articleMedia = article.media, !articleMedia.isEmpty {
            if let mediaMetadata = articleMedia[0].mediaMetadata, !articleMedia.isEmpty {
                let imageUrl = mediaMetadata[0].url
                cell.displayLogo(imageUrl)
            }
        }
    }
    
    func didSelectRow(at index: Int) {
        let _ = articlesData[index]
//        view?.navigateToLeagueDetailsScreen(with: leagueId)
    }
}
