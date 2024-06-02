//
//  UserService.swift
//  TestApi
//
//  Created by rendi on 22.04.2024.
//

import Foundation

struct UserResponse: Decodable {
    struct UserData: Decodable {
        let id: Int
        let email: String
        let first_name: String
        let last_name: String
        let avatar: String?
    }
    let data: [UserData]
}


struct GetUsersEndpoint: APIEndpoint {
    typealias ResponseType = UserResponse
    
    let path = "/users"
    let method = "GET"
    let headers: [String: String]? = ["Authorization": "Bearer YOUR_ACCESS_TOKEN"]
    let body: Data? = nil
}
