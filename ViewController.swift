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
    
    var imageArray = [Photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getPhotos()
        requestData()
        
    }
    
    // Alamofire Usage
    func requestData() {
        
        let url = "https://jsonplaceholder.typicode.com/photos"
        
        AF.request(url, method: .get).validate().responseDecodable(of: [Photos].self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let photos):
                self.imageArray = photos
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

// URL Session Usage
//    func getPhotos() {
//        let session = URLSession.shared
//        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
//        request.httpMethod = "GET"
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                do {
//                    let posts =  try JSONDecoder().decode([Photos].self, from: data)
//                    self.imageArray = posts
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            } else {
//                print(error?.localizedDescription ?? "")
//            }
//        }.resume()
//    }

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell" , for: indexPath) as! CollectionViewCell
      //  cell.imageLabel.load(url: URL(string: imageArray[indexPath.row].thumbnailUrl ?? "")!)
        cell.titleLabel.text = imageArray[indexPath.row].title
        cell.imageLabel.sd_setImage(with: URL(string: imageArray[indexPath.row].thumbnailUrl ?? "" ))
        
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

