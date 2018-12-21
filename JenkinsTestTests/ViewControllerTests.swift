//
//  ViewControllerTests.swift
//  JenkinsTestTests
//
//  Created by Paweł Piątkowski on 21/12/2018.
//  Copyright © 2018 Paweł Piątkowski. All rights reserved.
//

import XCTest
@testable import JenkinsTest

class ViewControllerTests: XCTestCase {

    private var viewController: ViewController?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateInitialViewController() as? ViewController
        viewController?.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testViewController() {
        XCTAssertNotNil(viewController?.label)
        XCTAssert(false)
    }
}
