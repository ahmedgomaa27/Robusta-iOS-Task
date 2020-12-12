//
//  DateUtilsTests.swift
//  GithubDemoAppTests
//
//  Created by Ahmed Hamdy on 13/12/2020.
//

import XCTest
@testable import GithubDemoApp

class DateUtilsTests: XCTestCase {

    let newDateTextAPiValue: String = "2020-10-22T14:37:16Z"
    let oldDateTextAPiValue: String = "2010-10-22T14:37:16Z"
    let newDateText: String = "Thursday, Oct 22, 2020"
    let oldDateText: String = "10 years ago"


    func testNewDate() {
        XCTAssertEqual(DateUtils.getRepositoryDateFormat(dateString: newDateTextAPiValue), newDateText)
    }

    func testOldDate() {
        XCTAssertEqual(DateUtils.getRepositoryDateFormat(dateString: oldDateTextAPiValue), oldDateText)
    }
}
