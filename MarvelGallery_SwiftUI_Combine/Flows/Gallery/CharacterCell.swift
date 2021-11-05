//
//  CharacterCell.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct CharacterCell: View {
    
    let imageUrl: URL?
    
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "photo")
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(imageUrl: nil)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
