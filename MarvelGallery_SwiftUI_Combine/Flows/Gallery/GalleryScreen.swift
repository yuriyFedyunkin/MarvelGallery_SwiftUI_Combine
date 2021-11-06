//
//  GalleryScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct GalleryScreen: View {
    
    @ObservedObject private var viewModel: GalleryViewModel
    @State private var showDetails: Bool = false
    
    private let appearance = Appearance()
    private var layout: [GridItem] {
        [GridItem(.adaptive(minimum: appearance.itemSize),
                  spacing: appearance.spacing)]
    }
    
    init(viewModel: GalleryViewModel = GalleryViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: appearance.spacing) {
                    ForEach(viewModel.characters, id: \.id) { character in
                        CharacterCell(imageUrl: character.imageUrl)
                            .frame(width: appearance.itemSize, height: appearance.itemSize)
                            .background(Color.black)
                            .onTapGesture {
                                segue(character: character)
                            }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Image(Constants.logo))
            .background(
                NavigationLink(
                    destination: DetailsLoadingView(character: viewModel.selectedCharacter),
                    isActive: $showDetails,
                    label: { EmptyView() })
            )
        }
        .environmentObject(viewModel)
    }
    
    private func segue(character: CharacterModel) {
        viewModel.selectedCharacter = character
        showDetails.toggle()
    }
}

extension GalleryScreen {
    
    struct Appearance {
        let spacing: CGFloat = 1
        var itemSize: CGFloat {
            UIScreen.main.bounds.width / 3 - spacing
        }
    }
}

struct GalleryScreen_Previews: PreviewProvider {
    static var previews: some View {
            GalleryScreen()
    }
}
