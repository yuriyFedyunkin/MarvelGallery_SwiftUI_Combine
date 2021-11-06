//
//  DetailsScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

// MARK: Additional view for lazy navigation logic
struct DetailsLoadingView: View {
    
    private var character: CharacterModel?
    
    init(character: CharacterModel?) {
        self.character = character
    }
    
    var body: some View {
        ZStack {
            if let character = character {
                DetailsScreen(character: character)
            }
        }
    }
}

struct DetailsScreen: View {
    
    @EnvironmentObject private var viewModel: GalleryViewModel
    
    private let character: CharacterModel
    private let appearance = Appearance()
    
    init(character: CharacterModel) {
        self.character = character
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CharacterCell(imageUrl: character.imageUrl)
                    .frame(width: appearance.imageWidth,
                           height: appearance.imageWidth)
                
                Text(character.description)
                    .kerning(appearance.kerning)
                    .lineSpacing(appearance.lineSpacing)
                    .font(appearance.font)
                    .padding()
                
                SuggestionsView(suggestions: viewModel.getSuggetions(for: character))
            }
        }
        .navigationTitle(character.name)
    }
}

extension DetailsScreen {
    
    struct Appearance {
        let font = Font.system(size: 14, weight: .regular)
        let lineSpacing: CGFloat = 4
        let kerning: CGFloat = -0.41
        let imageWidth = UIScreen.main.bounds.width
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(character: dev.character)
    }
}
