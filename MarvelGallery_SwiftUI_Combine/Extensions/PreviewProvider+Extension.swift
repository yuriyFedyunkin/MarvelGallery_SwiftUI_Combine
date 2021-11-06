//
//  PreviewProvider+Extension.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        DeveloperPreview.shared
    }
}

final class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    private init() {}
    
    let character = CharacterModel(
        id: 1,
        name: "Spider-Man",
        description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.",
        modified: "2020-07-21T10:30:10-0400",
        thumbnail: CharacterModel.Thumbnail(
            path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b",
            extension: "jpg"))
}
