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
    var searchKeyWord = "apple"

    init(view: ListViewDelegate) {
        self.view = view
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
    }

    func handleResponse(list: [Repository]?) {
        view.hideLoading()
        if let reposList = list {
            self.dataModel.removeAll()
            self.listingModel.removeAll()
            if reposList.count > 0 {
                self.dataModel.append(contentsOf: reposList)
                self.listingModel.append(contentsOf: reposList[0...self.pageSize - 1])
                self.view.refreshView()
            } else {
                self.view.showNoResultsView()
            }
        } else {
            self.view.showNetworkError()
        }
    }

    func clearSearch() {
        listingModel.removeAll()
        searchKeyWord = "apple"
        fetchReposData()
    }

    func getRepositoryDetails(url: String) {
        view.showLoading()
        service.getRepositoryDetails(fromUrl: url) { [weak self] (response) in
            guard let self = self else {return}
            self.view.hideLoading()
            if let repository = response {
                self.view.updateDetailsView(repository: repository)
            } else {
                self.view.showNetworkError()
            }
        }
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
