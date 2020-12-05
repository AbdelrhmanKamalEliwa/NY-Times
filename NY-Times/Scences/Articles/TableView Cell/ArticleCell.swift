//
//  ArticleCell.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet private weak var articleLogoImageView: UIImageView!
    @IBOutlet private weak var articleTitleLabel: UILabel!
    @IBOutlet private weak var articleSubtitleLabel: UILabel!
    @IBOutlet private weak var articleDateLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: - Display Cell Data
extension ArticleCell: ArticlesCellView {
    func displayTitle(_ title: String) {
        articleTitleLabel.text = title
    }
    
    func displaySubtitle(_ subtitle: String) {
        articleSubtitleLabel.text = subtitle
    }
    
    func displayDate(_ date: String) {
        articleDateLabel.text = date
    }
    
    func displayLogo(_ imageUrl: String?) {
        
    }
}
