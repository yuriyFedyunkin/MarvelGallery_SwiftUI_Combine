//
//  DetailsScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct DetailsScreen: View {
    
    let character: CharacterModel
    private let appearance = Appearance()
    
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
                
                SuggestionsView()
            }
        }
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
