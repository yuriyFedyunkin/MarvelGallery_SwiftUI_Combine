//
//  SuggestionsView.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

struct SuggestionsView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore More")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .bottom])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0 ..< 10) { _ in
                        CharacterCell(imageUrl: nil)
                            .frame(width: 120, height: 120)
                            .background(.white)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsView()
    }
}
