//
//  ListViewControllerTests.swift
//  ListViewControllerTests
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import XCTest
@testable import GithubDemoApp

class ListViewControllerTests: XCTestCase {


    var listViewController: ListViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        else {
            XCTFail()
            return
        }
        listViewController = navigationController.viewControllers.first as? ListViewController
        listViewController?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutletsShouldBeConnected() {
        XCTAssertNotNil(listViewController?.repositoriesTableView, "tableView")
    }

    func testTableViewDelegatesShouldBeConnected() {
        XCTAssertNotNil(listViewController?.repositoriesTableView.dataSource, "dataSource")
        XCTAssertNotNil(listViewController?.repositoriesTableView.delegate, "delegate")
    }

    func testNavigationTitle() {
        XCTAssertEqual(listViewController?.title, "Github Repositories")
    }

    func testPresenterShouldBeConnected() {
        XCTAssertNotNil(listViewController?.presenter)
    }

    func testSearchControllerShouldBeSet() {
        XCTAssertNotNil(listViewController?.searchController.searchBar.delegate)
        XCTAssertEqual(listViewController?.searchController.searchBar.placeholder,
                       "Enter Repository Name")
    }

}
