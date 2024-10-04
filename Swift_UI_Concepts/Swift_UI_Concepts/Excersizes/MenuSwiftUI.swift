//
//  MenuSwiftUI.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 03/10/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import SwiftUI

struct MenuSwiftUI: View {
    var body: some View {
        if #available(iOS 14.0, *) {
            Menu("Click Me") {
                Button("One") {
                    print("one")
                }
                
                Button("Two") {
                    print("Two")
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MenuSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUI()
    }
}
