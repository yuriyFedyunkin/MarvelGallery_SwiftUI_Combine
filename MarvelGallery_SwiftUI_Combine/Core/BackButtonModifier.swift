//
//  BackButtonModifier.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    
    @GestureState private var dragOffset: CGSize = .zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(
                    action : {
                        mode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(Color.white)
                    })
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, transaction) in
                        if(value.startLocation.x < 20 && value.translation.width > 100) {
                            self.mode.wrappedValue.dismiss()
                        }
                    })
            )
    }
}
