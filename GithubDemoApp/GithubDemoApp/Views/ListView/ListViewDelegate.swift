//
//  ListViewDelegate.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import Foundation

protocol ListViewDelegate: class {
    func showLoading()
    func hideLoading()
    func refreshView()
}
