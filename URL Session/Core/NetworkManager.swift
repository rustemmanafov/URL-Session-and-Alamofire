//
//  NetworkManager.swift
//  URL Session
//
//  Created by Rustem Manafov on 19.08.22.
//

import Foundation
import Alamofire

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethods, complete: @escaping((T) -> ())) {
        AF.request(url, method: .get).validate().responseDecodable(of: T.self) { response in
            debugPrint(response)

            switch response.result {
            case .success(let photos):
                complete(photos)
            case .failure(let error):
                print(error)
            }
        }
    }
    
       
    }

