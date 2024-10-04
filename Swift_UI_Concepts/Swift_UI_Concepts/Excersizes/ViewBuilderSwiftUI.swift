//
//  ViewBuilderSwiftUI.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 03/10/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import SwiftUI

struct LocalViewBuilder: View {
    enum ViewType {
        case one
        case two
        case three
    }
    
    let viewType: ViewType
    
    var body: some View {
        VStack {
            headerSectionView
        }
       
    }
    
    @ViewBuilder private var headerSectionView: some View {
        if viewType == .one{
            firstView
            
        } else if viewType == .two {
            secondView
        } else if viewType == .three {
            thirdView
        }
    }
    
    private var firstView: some View {
        Text("firstView")
    }
    
    private var secondView: some View {
        VStack {
            Text("Second View")
            Image(systemName: "heart.fill")
        }
        
    }
    
    private var thirdView: some View {
        Image(systemName: "heart.fill")
    }
    
}

struct HeaderViewBuilder: View {
    let title: String
    let description: String?
    var body: some View {
        
        VStack (alignment: .leading){
            Text(title).font(.largeTitle).fontWeight(.bold)
            if let des = description {
                Text(des).font(.callout).fontWeight(.semibold)
            }
            
            RoundedRectangle(cornerRadius: 5).frame(height: 2)
            Spacer()
        }.frame(maxWidth:.infinity, alignment: .leading).padding()
    }
}

struct GenericHeaderView<Content: View>: View {
    let title: String
    let content: Content
    
    //    init(title: String, content: Content?) {
    //        self.title = title
    //        self.content = content
    //    }
    
    init(title: String, @ViewBuilder content: ()->Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text(title).font(.largeTitle).fontWeight(.bold)
            content
            
            RoundedRectangle(cornerRadius: 5).frame(height: 2)
            Spacer()
        }.frame(maxWidth:.infinity, alignment: .leading).padding()
    }
}

struct ViewBuilderSwiftUI: View {
    var body: some View {
        VStack{
            HeaderViewBuilder(title: "View Builder Excersize", description: "View Builder Related Code")
            GenericHeaderView(title: "Generic header") {
                HStack{
                    Text("Nagarajan")
                }
            }
            Spacer()
            LocalViewBuilder(viewType: .two)
        }
        
        
    }
}

struct ViewBuilderSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderSwiftUI()
    }
}
