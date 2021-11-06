//
//  CharacterCell.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import Kingfisher
import SwiftUI

struct CharacterCell: View {
    
    let imageUrl: URL?
    
    var body: some View {
        KFImage.url(imageUrl)
            .resizable()
            .placeholder { progress in
                ProgressView(progress)
                    .progressViewStyle(GaugeProgressStyle())
            }
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.2)
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(imageUrl: dev.character.imageUrl)
            .frame(width: 300, height: 300)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}


