//
//  PostUsersViewModel.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 02/10/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class WebService: Codable {
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard (200...299).contains(httpResponse.statusCode) else { throw NetworkError.badStatus }
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch NetworkError.badUrl {
            print("Bad URL")
        } catch NetworkError.badResponse {
            print("Bad Response")
        } catch NetworkError.badStatus {
            print("Bad Status")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response")
        } catch {
            print("An unexpected error occurred: \(error)")
        }
        return nil
    }
}

@MainActor class PostViewModel: ObservableObject {
    @Published var postData = [Post]()
    
    func fetchData() async {
        guard let downloadedData: [Post] = await WebService().downloadData(fromURL: "https://jsonplaceholder.typicode.com/posts") else {return}
        postData = downloadedData
    }
}
  

