//
//  GalleryScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct GalleryScreen: View {
    
    private var layout: [GridItem] {
        [GridItem(.adaptive(minimum: appearance.itemSize),
                  spacing: appearance.spacing)]
    }
    private let appearance = Appearance()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: appearance.spacing) {
                    ForEach(0 ..< 10) { _ in
                        CharacterCell(imageUrl: nil)
                            .frame(width: appearance.itemSize, height: appearance.itemSize)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Image(Constants.logo))
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
