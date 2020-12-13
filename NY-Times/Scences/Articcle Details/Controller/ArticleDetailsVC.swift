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
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Presenter Delegate
extension ArticleDetailsVC {
    func setMedia(imageUrl: String) {
        mediaImageView.cornerRadius = mediaImageView.frame.height / 2
        print(imageUrl)
        mediaImageView.setImageUrl(imageUrl)
    }
}

// MARK: - Setup TableView
extension ArticleDetailsVC: UITableViewDelegate, UITableViewDataSource {
    private enum TableViewConstants {
        static let cellNibName = "ArticleDetailsCell"
        static let cellIdentifier = "ArticleDetailsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: TableViewConstants.cellNibName, bundle: nil),
            forCellReuseIdentifier: TableViewConstants.cellIdentifier)
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
        let articleDetailsCell = tableView.dequeueReusableCell(
            withIdentifier: TableViewConstants.cellIdentifier,
            for: indexPath) as! ArticleDetailsCell
        presenter?.articleDetailsCellConfiguration(articleDetailsCell, for: indexPath.section)
        return articleDetailsCell
    }
}
