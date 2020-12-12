//
//  ListViewPresenter.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import Foundation

class ListViewPresenter: NSObject {

    weak var view: ListViewDelegate!
    var dataModel: [Repository] = []
    var listingModel: [Repository] = []
    let service = NetworkManager()

    let pageSize: Int = 10
    //Search API needs any text to return resluts, so i set default value with apple
    var searchKeyWord: String = ""
    let defaultSearchKeyword: String = "apple"

    init(view: ListViewDelegate) {
        self.view = view
        searchKeyWord = defaultSearchKeyword
    }

    @objc func fetchReposData() {
        view.showLoading()
        service.getRepositoriesWithName(searchKeyWord) { [weak self] (list) in
            guard let self = self else {return}
            self.handleResponse(list: list)
        }
    }

    func getItem(for index: Int) -> Repository {
        listingModel[index]
    }

    func getNumberOfItems() -> Int {
        listingModel.count
    }

    func search(with keyWord: String) {
        if keyWord.count > 1 {
            searchKeyWord = keyWord
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            perform(#selector(fetchReposData), with: nil
                    , afterDelay: 0.5)
        }

        if keyWord.count == 0 {
            searchKeyWord = defaultSearchKeyword
            fetchReposData()
        }
    }

    func handleResponse(list: [Repository]?) {
        view.hideLoading()
        if let reposList = list {
            self.dataModel.removeAll()
            self.listingModel.removeAll()

            switch reposList.count {
            case 0:
                self.view.showNoResultsView()
            case 1...(pageSize - 1):
                self.dataModel.append(contentsOf: reposList)
                self.listingModel.append(contentsOf: reposList)
                self.view.refreshView()
            default:
                self.dataModel.append(contentsOf: reposList)
                self.listingModel.append(contentsOf: reposList[0..<self.pageSize])
                self.view.refreshView()
            }
        } else {
            self.view.showNetworkError()
        }
    }

    func clearSearch() {
        listingModel.removeAll()
        searchKeyWord = defaultSearchKeyword
        fetchReposData()
    }

    func loadMore() {
        if dataModel.count > listingModel.count {
            let firstIndex: Int = listingModel.count
            let lastIndex: Int = firstIndex + pageSize - 1
            listingModel.append(contentsOf: dataModel[firstIndex...lastIndex])
            view.refreshView()
        }
    }
}
