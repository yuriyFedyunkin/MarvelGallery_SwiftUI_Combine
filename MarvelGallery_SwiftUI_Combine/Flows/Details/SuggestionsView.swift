//
//  SuggestionsView.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

struct SuggestionsView: View {
    
    @State private var showSelected: Bool = false
    @State private var selectedCharacter: CharacterModel?
    
    private let suggestions: [CharacterModel]
    private let appearance = Appearance()
    
    init(suggestions: [CharacterModel]) {
        self.suggestions = suggestions
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore More")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .bottom])
            
            suggestionsView
                .padding(.horizontal)
                .background(
                    NavigationLink(
                        destination: DetailsLoadingView(character: selectedCharacter),
                        isActive: $showSelected,
                        label: { EmptyView() })
                )
        }
    }
    
    private func segue(character: CharacterModel) {
        selectedCharacter = character
        showSelected.toggle()
    }
}

extension SuggestionsView {
    
    private var suggestionsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: appearance.spacing) {
                ForEach(suggestions, id: \.id) { character in
                    CharacterCell(imageUrl: character.imageUrl)
                        .frame(width: appearance.imageWidth,
                               height: appearance.imageWidth)
                        .background(.black)
                        .onTapGesture {
                            segue(character: character)
                        }
                }
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
