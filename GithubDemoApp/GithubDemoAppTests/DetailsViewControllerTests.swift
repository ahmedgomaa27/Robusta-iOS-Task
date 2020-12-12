//
//  DetailsViewControllerTests.swift
//  GithubDemoAppTests
//
//  Created by Ahmed Hamdy on 12/12/2020.
//

import XCTest
@testable import GithubDemoApp

class DetailsViewControllerTests: XCTestCase {

    var detailsVC: RepositoryDetailsController?
    var mockedRepo: Repository {
        let item = Repository()
        let owner = Owner()
        owner.avatarUrl = "avatarUrl"
        item.owner = owner
        item.repositoryDescription = "repositoryDescription"
        item.name = "test details"
        item.stargazersCount = 1
        item.forksCount = 2
        item.openIssuesCount = 3
        item.language = "Swift"
        return item
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RepositoryDetailsController") as? RepositoryDetailsController
        detailsVC?.repository = mockedRepo
        detailsVC?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        detailsVC = nil
    }

    func testNavigationTitle() {
        XCTAssertEqual(detailsVC?.title, mockedRepo.name)
    }

}
