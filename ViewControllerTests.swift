//
//  ViewControllerTests.swift
//  AssignmentWiproTests
//
//  Created by Aditi Garg on 09/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import XCTest
@testable import AssignmentWipro

class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitMyTableView() {
        let vc = ViewController()
        _ = vc.view
        //calls viewDidLoad from toDo vc
        XCTAssertNotNil(vc.tableView)
    }
    
    

}
