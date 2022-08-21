//
//  CollectionViewCell.swift
//  URL Session
//
//  Created by Rustem Manafov on 09.08.22.
//

import UIKit
import SDWebImage

protocol TitlePhotosCellProtocol {
    var titleText: String  { get }
    var photoImage: String { get }
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: TitlePhotosCellProtocol) {
        titleLabel.text = item.titleText
        // Use SDWebImage
        imageLabel.sd_setImage(with: URL(string: item.photoImage))
    }
}
