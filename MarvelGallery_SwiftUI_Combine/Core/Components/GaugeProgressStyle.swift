//
//  GaugeProgressStyle.swift
//  MarvelGallery_SwiftUI_Combine
//
//  Created by Yuriy Fedyunkin on 06.11.2021.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    
    private let strokeColor: Color = .white
    private let strokeWidth = 5.0
    private let size = CGSize(width: 25, height: 25)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(configuration.fractionCompleted ?? .zero))
                .stroke(strokeColor,
                        style: StrokeStyle(
                            lineWidth: CGFloat(strokeWidth),
                            lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: size.width, height: size.height)
        }
    }
}
