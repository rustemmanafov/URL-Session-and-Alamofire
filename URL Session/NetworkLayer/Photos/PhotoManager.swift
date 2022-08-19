//
//  PhotoManager.swift
//  URL Session
//
//  Created by Rustem Manafov on 19.08.22.
//

import UIKit

class PhotoManager {
    
    static let shared = PhotoManager()
    
    func getPhotos(complete: @escaping(([Photos]) -> ())) {
        
        NetworkManager.shared.request(type: [Photos].self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "photos"),
                                      method: .get) { responce in
            complete(responce)
        }
        
        
        
    }
}
