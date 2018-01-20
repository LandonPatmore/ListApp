//
//  ListAppUITests.swift
//  ListAppUITests
//
//  Created by Landon Patmore on 1/17/18.
//  Copyright © 2018 Landon Patmore. All rights reserved.
//

import XCTest

class ListAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Groceries"]/*[[".cells.staticTexts[\"Groceries\"]",".staticTexts[\"Groceries\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        for _ in 1...10 {
            tablesQuery/*@START_MENU_TOKEN@*/.textFields["Add item..."]/*[[".cells.textFields[\"Add item...\"]",".textFields[\"Add item...\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            let textField = tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element
            textField.typeText("Watermelon")
            app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        }
        
    }
    
}
