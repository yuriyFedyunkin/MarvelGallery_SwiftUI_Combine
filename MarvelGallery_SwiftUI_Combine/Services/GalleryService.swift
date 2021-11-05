//
//  GalleryService.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import Combine
import Foundation

protocol GalleryService {
    func fetchGallery() -> AnyPublisher<[CharacterModel], GalleryError>
}

final class GalleryServiceImpl: GalleryService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchGallery() -> AnyPublisher<[CharacterModel], GalleryError> {
        guard let url = URL(string: Constants.apiURL) else {
            let error = GalleryError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CharacterModel].self, decoder: JSONDecoder())
            .mapError { error in
            .parsing(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Errors
enum GalleryError: Error {
    case parsing(description: String)
    case network(description: String)
}
