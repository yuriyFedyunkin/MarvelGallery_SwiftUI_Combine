//
//  GalleryScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct GalleryScreen: View {
    
    private let appearance = Appearance()
    
    var body: some View {
        NavigationView {
            ScrollView {
                EmptyView()
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
        NavigationView{
            GalleryScreen()
        }
    }
}
