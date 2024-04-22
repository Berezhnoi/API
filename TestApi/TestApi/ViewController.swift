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
    }
    
    private func loadUsers() {
        apiClient.request(GetUsersEndpoint()) { result in
            switch result {
            case .success(let user):
                print("User fetched successfully: \(user)")
            case .failure(let error):
                print("Error fetching user: \(error)")
            }
        }
    }
}
