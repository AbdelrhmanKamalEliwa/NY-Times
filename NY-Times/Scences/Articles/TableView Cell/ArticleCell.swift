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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Methods
    func setupCellUI() {
//        articleLogoImageView.image = UIImage(named: "logo.not.found")
//        articleTitleLabel.text = "logo.not.found"
//        articleSubtitleLabel.text = "logo.not.found"
//        articleDateLabel.text = "logo.not.found"
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
        if let imageUrl = imageUrl {
            guard let url = URL(string: imageUrl) else { return }
            articleLogoImageView.kf.indicatorType = .activity
            articleLogoImageView.kf.setImage(
                with: url, placeholder: nil, options: nil,
                progressBlock: nil) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.articleLogoImageView.image = image.image
                case .failure:
                    self.articleLogoImageView.image = UIImage(named: "logo.not.found")?.imageFlippedForRightToLeftLayoutDirection()
                    return
                }
            }
        } else {
            self.articleLogoImageView.image = UIImage(named: "logo.not.found")?.imageFlippedForRightToLeftLayoutDirection()
        }
    }
}
