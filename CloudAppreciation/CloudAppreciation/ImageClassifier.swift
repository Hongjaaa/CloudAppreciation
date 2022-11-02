//
//  ImageClassifier.swift
//  CloudAppreciation
//
//  Created by 최홍준 on 2022/08/30.
//

import SwiftUI

class ImageClassifier: ObservableObject {

    @Published private var classifier = Classifier()

    var imageClass: String? {
        classifier.results
    }

    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
