//
//  CustomActivityIndicator.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 23/09/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .red
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
    
    }
