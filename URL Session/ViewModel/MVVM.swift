//
//  MVVM.swift
//  URL Session
//
//  Created by Rustem Manafov on 16.08.22.
//

import UIKit
import Alamofire

class UrlSessionViewModel {
    
    var imageArray = [Photos]()
    
    func requestData(complete: @escaping(() -> ())) {
        PhotoManager.shared.getPhotos { items in
            self.imageArray = items
            complete()
        }
        
        
}
    
}
 
    // URL Session Usage
    //    func getPhotos(complete: @escaping(() -> ())) {
    //
    //            let session = URLSession.shared
    //            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
    //            request.httpMethod = method.rawValue
    //            session.dataTask(with: request) { data, response, error in
    //                if let error = error {
    //                    print(error.localizedDescription)
    //                } else if let data = data {
    //                    do {
    //                        let posts =  try JSONDecoder().decode([Photos].self, from: data)
    //                        self.imageArray = posts
    //                                DispatchQueue.main.async {
    //                            self.collectionView.reloadData()
    //                        }
    //                        //MVVM Clousure
    //                        complete()
    //                    } catch {
    //                        print(error.localizedDescription)
    //                    }
    //                } else {
    //                    print(error?.localizedDescription ?? "")
    //                }
    //            }.resume()
    //        }
    
    //  Alamofire Usage
//    func requestData(complete: @escaping(() -> ())) {
//
//        let url = "https://jsonplaceholder.typicode.com/photos"
//
//        AF.request(url, method: .get).validate().responseDecodable(of: [Photos].self) { response in
//            debugPrint(response)
//
//            switch response.result {
//            case .success(let photos):
//                self.imageArray = photos
//                complete()
//
//            case .failure(let error):
//                print(error)
//            }
//        }
 
