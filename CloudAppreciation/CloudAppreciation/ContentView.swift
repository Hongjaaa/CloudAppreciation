//
//  ContentView.swift
//  CloudAppreciation
//
//  Created by 최홍준 on 2022/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @ObservedObject var classifier: ImageClassifier

    var body: some View {
        VStack{
            HStack{
                Image(systemName: "photo")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .photoLibrary
                    }
                Spacer()
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
            }
            .font(.title)
            .foregroundColor(.black)

            Rectangle()
                .strokeBorder()
                .foregroundColor(.black)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                        }
                    })
            Group {
                if let imageClass = classifier.imageClass {
                    HStack{
                        Text("구름 종류:")
                            .font(.caption)
                        Text(imageClass)
                            .bold()
                    }
                } else {
                    HStack{
                        Text("구름 종류")
                            .font(.caption)
                    }
                }
            }
            .font(.subheadline)
            .padding()
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
