//
//  ViewController.swift
//  TestApi
//
//  Created by rendi on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {
    private let apiClient: APIClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        loadResources()
    }
    
    private func loadUsers() {
        apiClient.request(GetUsersEndpoint()) { result in
            switch result {
            case .success(let users):
                print("Users fetched successfully: \(users)")
            case .failure(let error):
                print("Error fetching users: \(error)")
            }
            print("\n")
        }
    }
    
    private func loadResources() {
        apiClient.request(GetResourcesEndpoint()) { result in
            switch result {
            case .success(let resources):
                print("Resources fetched successfully: \(resources)")
            case .failure(let error):
                print("Error fetching resources: \(error)")
            }
            print("\n")
        }
    }
}
