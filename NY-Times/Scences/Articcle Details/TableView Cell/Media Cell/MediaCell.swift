//
//  MediaCell.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 05/12/2020.
//

import UIKit
import Kingfisher

class MediaCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var mediaImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Display Cell Data
extension MediaCell: MediaCellView {
    func displayLogo(_ imageUrl: String?) {
        if let imageUrl = imageUrl {
            guard let url = URL(string: imageUrl) else { return }
            mediaImageView.kf.indicatorType = .activity
            mediaImageView.kf.setImage(
                with: url, placeholder: nil, options: nil,
                progressBlock: nil) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.mediaImageView.image = image.image
                case .failure:
                    self.mediaImageView.image = UIImage(named: "logo.not.found")?.imageFlippedForRightToLeftLayoutDirection()
                    return
                }
            }
        } else {
            self.mediaImageView.image = UIImage(named: "logo.not.found")?.imageFlippedForRightToLeftLayoutDirection()
        }
    }
}
