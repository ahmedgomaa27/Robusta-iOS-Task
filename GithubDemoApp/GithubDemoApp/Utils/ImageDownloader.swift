//
//  ImageDownloader.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

import UIKit

class ImageDownloader {

    static func loadImage(imageUrlPath: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: imageUrlPath) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    return
                }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    completion(UIImage(data: data))
                }
            }.resume()
        }
    }
}
