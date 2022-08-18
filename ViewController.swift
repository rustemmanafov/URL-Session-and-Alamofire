//
//  ViewController.swift
//  URL Session
//
//  Created by Rustem Manafov on 09.08.22.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = UrlSessionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPhotos {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
//        viewModel.requestData() {
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell" , for: indexPath) as! CollectionViewCell
      //  cell.imageLabel.load(url: URL(string: imageArray[indexPath.row].thumbnailUrl ?? "")!)
        cell.titleLabel.text = viewModel.imageArray[indexPath.row].title
        cell.imageLabel.sd_setImage(with: URL(string: viewModel.imageArray[indexPath.row].thumbnailUrl ?? "" ))
        
        return cell
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

