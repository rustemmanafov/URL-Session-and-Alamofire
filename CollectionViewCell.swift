//
//  CollectionViewCell.swift
//  URL Session
//
//  Created by Rustem Manafov on 09.08.22.
//

import UIKit

protocol TitlePhotosCellProtocol {
    var titleText: String  { get }
    var photoImage: String { get }
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: TitlePhotosCellProtocol) {
        titleLabel.text = item.titleText
        imageLabel.image = UIImage(named: item.photoImage)
    }
}
