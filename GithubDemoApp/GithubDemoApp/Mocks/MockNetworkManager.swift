//
//  MockNetworkManager.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 12/12/2020.
//

import Foundation

class MockNetworkManager: NSObject, NetworkProtocol {

    let repo1 = Repository()
    let repo2 = Repository()

    var mockedList: [Repository] = []

    func setup() {
        repo1.name = "apple Repo 1"
        repo2.name = "apple Repo 2"
        mockedList = [repo1, repo2]
    }

    func getRepositoriesWithName(_ name: String!, completion: (([Repository]?) -> Void)!) {
        mockedList = mockedList.filter({ (item) -> Bool in
            return item.name.lowercased().contains(name.lowercased())
        })
        completion(mockedList)
    }
}
