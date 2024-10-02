//
//  ContentView.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 23/09/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var vm =  UsersViewModel()
    var body: some View {
        VStack {
            if vm.isRefreshing {
                CustomActivityIndicator()
            } else {
                //Text(vm.users?.ip ?? "No IP available")
                List {
                    Section(header: Text("General Info")) {
                        Text(vm.users?.ip ?? "No IP available")
                    }
                    Section(header: Text("Other Info")) {
                        Text(vm.users?.latitude.description ?? "No IP available")
                    }

                }
            }
            
            }.onAppear(perform: vm.fetchusersApiDetails).navigationBarTitle("User Information", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
