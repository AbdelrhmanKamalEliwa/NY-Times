//
//  ArticlesVC.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import UIKit
import SVProgressHUD

class ArticlesVC: BaseWireframe {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var periodSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var periodSegmentedControlBottomConstraint: NSLayoutConstraint!
    internal var presenter: ArticlesVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    @IBAction private func periodSegmentedControlTapped(_ sender: UISegmentedControl) {
        presenter?.setPeriod(periodSegmentedControl.selectedSegmentIndex)
    }
}

// MARK: - Presenter Delegate
extension ArticlesVC: ArticlesView {
    func scrollToTheTop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    func showIndicator() {
        SVProgressHUD.show()
    }
    
    func hideIndicator() {
        SVProgressHUD.dismiss()
    }
    
    func fetchDataSuccess() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presentGenericAlert(
                viewController: self,
                title: "Error",
                message: error,
                doneButtonTitle: "Okay",
                dismissButtonTitle: nil)
        }
    }
}

// MARK: - Setup TableView
extension ArticlesVC: UITableViewDelegate, UITableViewDataSource {
    private enum TableViewConstants {
        static let nibName = "ArticleCell"
        static let cellIdentifier = "ArticleCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: TableViewConstants.nibName, bundle: nil),
            forCellReuseIdentifier: TableViewConstants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfArticles() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewConstants.cellIdentifier,
            for: indexPath) as! ArticleCell
        presenter?.cellConfiguration(cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}

// MARK: - Period Segmented Control Animation
extension ArticlesVC {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.panGestureRecognizer.translation(in: self.view).y < 0 {
            periodSegmentedControlBottomConstraint.constant = -100
            UIView.animate(withDuration: 0.5) { [weak self] in self?.view.layoutIfNeeded() }
        } else {
            periodSegmentedControlBottomConstraint.constant = 20
            UIView.animate(withDuration: 0.5) { [weak self] in self?.view.layoutIfNeeded() }
        }
    }
}
