//
//  CharacterModel.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
}

extension CharacterModel {
    struct Thumbnail: Decodable {
        let path: String
        let `extension`: String
    }
    
    var imageUrl: URL? {
        URL(string: thumbnail.path + "." + thumbnail.extension)
    }
}
