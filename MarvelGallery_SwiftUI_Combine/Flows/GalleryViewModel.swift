//
//  GalleryViewModel.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import Combine
import SwiftUI

final class GalleryViewModel: ObservableObject {
    
    @Published var characters: [CharacterModel] = []
    private var cancellable = Set<AnyCancellable>()
    
    
    init(service: GalleryService = GalleryServiceImpl()) {
        service.fetchGallery()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] charecters in
                self?.characters = charecters
            }
            .store(in: &cancellable)
    }
}
