//
//  Users.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 02/10/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import Foundation

/*
 {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
   }
 */


struct Post: Codable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
