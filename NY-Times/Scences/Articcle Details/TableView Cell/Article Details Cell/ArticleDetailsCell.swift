//
//  ArticleDetailsCell.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import UIKit

class ArticleDetailsCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Display Cell Data
extension ArticleDetailsCell: ArticleDetailsCellView {
    func displayContent(_ title: String) {
        contentLabel.text = title
    }
}
