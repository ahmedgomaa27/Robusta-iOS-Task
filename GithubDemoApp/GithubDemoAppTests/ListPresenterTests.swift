//
//  ListPresenterTests.swift
//  GithubDemoAppTests
//
//  Created by Ahmed Hamdy on 12/12/2020.
//

import XCTest
@testable import GithubDemoApp

class ListPresenterTests: XCTestCase {


    let promise = XCTestExpectation(description: "success API Call: 200")
    var presenter: ListViewPresenter?
    let repoUrl = "https://api.github.com/users/mojombo"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = ListViewPresenter(view: self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPublicReposAPI() {
        presenter?.fetchReposData()
        wait(for: [promise], timeout: 1.0)
    }

    func testDetailsAPI() {
        presenter?.getRepositoryDetails(url: repoUrl)
        wait(for: [promise], timeout: 1.0)
    }

}

//MARK:- presenter delegate
extension ListPresenterTests: ListViewDelegate {
    func showLoading() {

    }

    func hideLoading() {

    }

    func showNetworkError() {

    }

    func refreshView() {
        promise.fulfill()
    }

    func updateDetailsView(repository: Repository) {
        promise.fulfill()
    }
}
