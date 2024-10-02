//
//  UsersViewModel.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 23/09/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import Foundation
import Combine

final class UsersViewModel: ObservableObject {
    @Published var users: Users?
    @Published var hasError = false
    @Published var error: UserError?
    
    
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    
    func fetchusersApiDetails() {
        
        let usersUrlString = "https://ipapi.co/json/"
        if let url = URL(string: usersUrlString) {
            
            isRefreshing = true
            hasError = false
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }  // Extract the data
                .decode(type: Users.self, decoder: JSONDecoder())  // Decode JSON directly
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                    
                    defer { self?.isRefreshing = false }
                    
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.error = UserError.custom(error: error)
                    case .finished:
                        break
                    }
                    }, receiveValue: { [weak self] users in
                        self?.users = users
                })
                .store(in: &bag)
        }
    }
    
}

extension UsersViewModel {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var enumDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to Decode"
            case .invalidStatusCode:
                return "invalid status code"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}



