//
//  NetworkHelper.swift
//  URL Session
//
//  Created by Rustem Manafov on 19.08.22.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    func urlConfiguratiom(url: String) -> String {
        baseUrl + url
    }
}
