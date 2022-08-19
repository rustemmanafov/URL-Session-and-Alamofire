//
//  Photos.swift
//  URL Session
//
//  Created by Rustem Manafov on 09.08.22.
//

import Foundation

struct Photos: Codable, TitlePhotosCellProtocol {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
    var titleText: String {
        title ?? ""
    }
    var photoImage: String {
        thumbnailUrl ?? ""
    }
}


