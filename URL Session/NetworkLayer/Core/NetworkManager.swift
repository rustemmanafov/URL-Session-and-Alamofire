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
    // Alamofire usage
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
    
    // URL Session usage
//    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethods, complete: @escaping((T) -> ())) {
//        let session = URLSession.shared
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = method.rawValue
//        session.dataTask(with: request) { data, responce, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                do {
//                    let items = try JSONDecoder().decode(T.self, from: data)
//                    complete(items)
//
//                    } catch {
//                        print(error.localizedDescription)
//
//            }
//            } else {
//                print("invalid data")
//            }
//    }.resume()
//
//    }

}
