//
//  DateUtils.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

import Foundation

class DateUtils {

    private static let dateFormatter = DateFormatter()

    static func getRepositoryDateFormat(dateString: String) -> String {
        var newValue: String = ""
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            // check if date more than 6 monthes
            let dateDiffrenece = Calendar.current.dateComponents([.month], from: date, to: Date()).month ?? 0

            if dateDiffrenece > 6 {
                newValue = getOldDateText(dateDiffrenece: dateDiffrenece)
            } else {
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                newValue = dateFormatter.string(from: date)
            }
        }
        return newValue
    }

    private static func getOldDateText(dateDiffrenece: Int) -> String {
        if dateDiffrenece < 12 {
            return "\(dateDiffrenece) month ago"
        } else {
            return "\(dateDiffrenece/12) years ago"
        }
    }

}
