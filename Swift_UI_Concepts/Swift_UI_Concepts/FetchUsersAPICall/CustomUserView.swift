//
//  CustomUserView.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 02/10/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import SwiftUI

struct CustomUserView: View {
    @StateObject var vm = PostViewModel()
    @State var isLoaded = false
    var body: some View {
        
        List(vm.postData){ post in
            HStack {
                           Text("\(post.userId)")
                               .padding()
                               .overlay(Circle().stroke(.blue))
                           
                           VStack(alignment: .leading) {
                               Text(post.title)
                                   .bold()
                                   .lineLimit(2)
                               
                               Text(post.body)
                                   .font(.caption)
                                   .foregroundColor(.secondary)
                                   .lineLimit(2)
                           }
                       }
            
        }.onAppear{
            if vm.postData.isEmpty && !isLoaded {
                Task {
                    await vm.fetchData()
                    isLoaded = true
                }
            }
        }
    }
    
}
struct CustomUserView_Previews: PreviewProvider {
    static var previews: some View {
        CustomUserView()
    }
}



