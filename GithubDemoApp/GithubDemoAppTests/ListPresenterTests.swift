//
//  ListPresenterTests.swift
//  GithubDemoAppTests
//
//  Created by Ahmed Hamdy on 12/12/2020.
//

import XCTest
@testable import GithubDemoApp

class ListPresenterTests: XCTestCase {

    var presenter: ListViewPresenter!
    let mockedService = MockNetworkManager()
    let listViewDelegate = MockListViewDelegate()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockedService.setup()
        presenter = ListViewPresenter(view: listViewDelegate, service: mockedService)
        presenter.fetchReposData()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }

    func testNumberOfItems() {
        presenter.fetchReposData()
        XCTAssertEqual(presenter.getNumberOfItems(), mockedService.mockedList.count)
    }

    func testClearSearch() {
        presenter.clearSearch()
        XCTAssertEqual(presenter.getNumberOfItems(), mockedService.mockedList.count)
    }

    func testRefreshView() {
        XCTAssertTrue(listViewDelegate.refreshViewCalled)
    }

    func testLoading() {
        XCTAssertFalse(listViewDelegate.isLoading)
    }

    func testSearch() {
        presenter.search(with: mockedService.mockedList.first?.name ?? "Repo 1")
        XCTAssertEqual(presenter.getNumberOfItems(), mockedService.mockedList.count)
    }

    func testGetItem() {
        XCTAssertEqual(presenter.getItem(for: 0).name, mockedService.mockedList[0].name)
    }

    func testEmptySearch() {
        presenter.search(with: "")
        XCTAssertEqual(presenter.getNumberOfItems(), mockedService.mockedList.count)
    }

}
