//
//  ArticleDetailsVC.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import UIKit

class ArticleDetailsVC: BaseWireframe, ArticleDetialsView {
    
    // MARK: - Properties
    internal var presenter: ArticleDetailsVCPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Setup TableView
extension ArticleDetailsVC: UITableViewDelegate, UITableViewDataSource {
    private enum TableViewConstants {
        static let ArticleDetailsCellNibName = "ArticleDetailsCell"
        static let ArticleDetailsCellIdentifier = "ArticleDetailsCell"
        static let MediaCellNibName = "MediaCell"
        static let MediaCellIdentifier = "MediaCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: TableViewConstants.ArticleDetailsCellNibName, bundle: nil),
            forCellReuseIdentifier: TableViewConstants.ArticleDetailsCellIdentifier)
        tableView.register(
            UINib(nibName: TableViewConstants.MediaCellNibName, bundle: nil),
            forCellReuseIdentifier: TableViewConstants.MediaCellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter?.titleForHeaderInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 3 {
            let mediaCell = tableView.dequeueReusableCell(
                withIdentifier: TableViewConstants.MediaCellIdentifier,
                for: indexPath) as! MediaCell
            presenter?.mediaCellConfiguration(mediaCell, for: indexPath.section, for: indexPath.row)
            return mediaCell
        } else {
            let articleDetailsCell = tableView.dequeueReusableCell(
                withIdentifier: TableViewConstants.ArticleDetailsCellIdentifier,
                for: indexPath) as! ArticleDetailsCell
            presenter?.articleDetailsCellConfiguration(articleDetailsCell, for: indexPath.section)
            return articleDetailsCell
        }
    }
}
