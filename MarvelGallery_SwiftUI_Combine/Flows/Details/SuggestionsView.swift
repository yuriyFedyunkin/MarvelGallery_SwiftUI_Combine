//
//  SuggestionsView.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

struct SuggestionsView: View {
    
    let suggestions: [CharacterModel]
    private let appearance = Appearance()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore More")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .bottom])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: appearance.spacing) {
                    ForEach(suggestions, id: \.id) { character in
                        CharacterCell(imageUrl: character.imageUrl)
                            .frame(width: appearance.imageWidth,
                                   height: appearance.imageWidth)
                            .background(.black)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

extension SuggestionsView {
    
    struct Appearance {
        let spacing: CGFloat = 16
        let imageWidth: CGFloat = 120
    }
}

struct SuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsView(suggestions: [])
    }
}
