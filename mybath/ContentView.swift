//
//  ContentView.swift
//  mybath
//
//  Created by Raul Telo Sanchez on 9/1/23.
//

import SwiftUI

struct ControllerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ConversionController
    
    func makeUIViewController(context: Context) -> ConversionController {
        let vc = ConversionController()
        // Do some configurations here if needed.
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ConversionController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            ControllerView()
        }
        .padding()
    }
}
