//
//  MockListViewDelegate.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 12/12/2020.
//

import Foundation

class MockListViewDelegate: ListViewDelegate {

    var isLoading: Bool = false
    var refreshViewCalled: Bool = false
    var showError: Bool = false
    var noResults: Bool = false

    func showLoading() {
        isLoading = true
    }

    func hideLoading() {
        isLoading = false
    }

    func refreshView() {
        refreshViewCalled = true
    }

    func showNetworkError() {
        showError = true
    }

    func showNoResultsView() {
        noResults = true
    }


}
