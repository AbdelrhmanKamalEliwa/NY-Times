//
//  ArticleCell.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var articleLogoImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleSubtitleLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellUI()
    }
    
    // MARK: - Methods
    func setupCellUI() {
        articleLogoImageView.cornerRadius = articleLogoImageView.frame.height / 2
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
        articleLogoImageView.setImageUrl(imageUrl)
    }
}
