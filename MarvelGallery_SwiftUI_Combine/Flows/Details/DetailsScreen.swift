//
//  DetailsScreen.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 05.11.2021.
//

import SwiftUI

struct DetailsScreen: View {
    var body: some View {
        ScrollView {
        VStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            Text("Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.")
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
        DetailsScreen()
    }
}
