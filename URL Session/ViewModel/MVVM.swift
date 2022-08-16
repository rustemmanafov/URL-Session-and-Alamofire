//
//  MVVM.swift
//  URL Session
//
//  Created by Rustem Manafov on 16.08.22.
//

import UIKit

class UrlSessionViewModel {
    
    var imageArray = [Photos]()

    // URL Session Usage
    func getPhotos(complete: @escaping(() -> ())) {
        
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
            request.httpMethod = "GET"
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    do {
                        let posts =  try JSONDecoder().decode([Photos].self, from: data)
                        self.imageArray = posts
                        //MVVM Clousure
                        complete()
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print(error?.localizedDescription ?? "")
                }
            }.resume()
        }
}
