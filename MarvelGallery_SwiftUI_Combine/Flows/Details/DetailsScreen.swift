//
//  DetailsScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct DetailsScreen: View {
    
    let character: CharacterModel
    
    var body: some View {
        ScrollView {
        VStack {
            CharacterCell(imageUrl: character.imageUrl)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.width)
            
            Text(character.description)
                .kerning(-0.41)
                .lineSpacing(4)
                .font(.system(size: 14, weight: .regular))
                .padding()
            
            SuggestionsView()
        }
    }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(character: dev.character)
    }
}
