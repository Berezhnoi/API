//
//  ResourceService.swift
//  TestApi
//
//  Created by rendi on 28.04.2024.
//

import Foundation

struct ResourceResponse: Decodable {
    struct ResourceData: Decodable {
        let id: Int
        let year: Int
        let name: String
        let color: String
        let pantone_value: String
    }
    let data: [ResourceData]
}


struct GetResourcesEndpoint: APIEndpoint {
    typealias ResponseType = ResourceResponse
    
    let path = "/unknown"
    let method = "GET"
    let headers: [String: String]? = ["Authorization": "Bearer YOUR_ACCESS_TOKEN"]
    let body: Data? = nil
}
