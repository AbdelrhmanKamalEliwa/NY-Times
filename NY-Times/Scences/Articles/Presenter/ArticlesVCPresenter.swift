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
    
    private func fetchData() {
        
    }
    
    func setAvailableStatus(_ segmentedControlIndex: Int) {
        view?.fetchDataSuccess()
    }
    
//    private func setAvailableLeagues() {
//        for league in leagues {
//            if availableLeaguesIDs.contains(league.id) {
//                availableLeagues.append(league)
//            }
//        }
//    }
//
//    private func setAvailableCachedLeagues() {
//        for league in cachedLeagues {
//            if availableLeaguesIDs.contains(Int(league.leagueId)) {
//                availableCachedLeagues.append(league)
//            }
//        }
//    }
    
//    func numberOfLeagues() -> Int {
//        if available {
//            return cach ? availableCachedLeagues.count : availableLeagues.count
//        } else {
//            return cach ? cachedLeagues.count : leagues.count
//        }
//    }
    
//    func cellConfiguration(_ cell: LeaguesCellView, for index: Int) {
//        if cach {
//            let league = available ? availableCachedLeagues[index] : cachedLeagues[index]
//            cell.displayName(league.leagueName ?? "")
//            if let areaName = league.areaName {
//                cell.displayArea(areaName, isHidden: false)
//            } else {
//                cell.displayArea("", isHidden: true)
//            }
//            cell.displayStartDate(league.startDate ?? "")
//            cell.displayEndDate(league.endDate ?? "")
//            let isHidden = availableLeaguesIDs.contains(Int(league.leagueId))
//            cell.setChevronIconStatus(isHidden: !isHidden)
//
//        } else {
//            let league = available ? availableLeagues[index] : leagues[index]
//            cell.displayName(league.name)
//            if let shortName = league.code {
//                cell.displayArea(shortName, isHidden: false)
//            } else {
//                cell.displayArea("", isHidden: true)
//            }
//            cell.displayStartDate(league.currentSeason?.startDate ?? "")
//            cell.displayEndDate(league.currentSeason?.endDate ?? "")
//            let isHidden = availableLeaguesIDs.contains(league.id)
//            cell.setChevronIconStatus(isHidden: !isHidden)
//        }
//    }
    
//    func didSelectRow(at index: Int) {
//        if available {
//            let leagueId = cach ? Int(availableCachedLeagues[index].leagueId) : availableLeagues[index].id
//            view?.navigateToLeagueDetailsScreen(with: leagueId)
//        } else {
//            let leagueId = cach ? Int(cachedLeagues[index].leagueId) : leagues[index].id
//            if availableLeaguesIDs.contains(leagueId) {
//                view?.navigateToLeagueDetailsScreen(with: leagueId)
//            } else {
//                view?.showError(error: "This competition is unavailable")
//            }
//        }
//
//    }
}
