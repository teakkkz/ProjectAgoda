//
//  AgdProjectUITests.swift
//  AgdProjectUITests
//
//  Created by Suwatchai on 2/2/2562 BE.
//  Copyright © 2562 suwatchai kiatchalermporn. All rights reserved.
//
import Foundation
import XCTest

class AgdProjectUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    
    func testTableRowText(){
        
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Centara Grand at CentralWorld"].tap()
        
        let hotelListButton = app.navigationBars["AgdProject.DetailView"].buttons["Hotel List"]
        hotelListButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Novotel Bangkok Ploenchit Sukhumvit"]/*[[".cells.staticTexts[\"Novotel Bangkok Ploenchit Sukhumvit\"]",".staticTexts[\"Novotel Bangkok Ploenchit Sukhumvit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        hotelListButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["The Tawana Bangkok"]/*[[".cells.staticTexts[\"The Tawana Bangkok\"]",".staticTexts[\"The Tawana Bangkok\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"AgdProject.DetailView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.staticTexts["The Tawana Bangkok"].tap()
        app.staticTexts["Area :"].tap()
        app.staticTexts["2"].tap()
        app.staticTexts["254"].tap()
        hotelListButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Grand Centre Point Hotel"]/*[[".cells.staticTexts[\"Grand Centre Point Hotel\"]",".staticTexts[\"Grand Centre Point Hotel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Grand Centre Point Hotel"].tap()
        app.staticTexts["Wireless"].tap()
        app.staticTexts["3"].tap()
        app.staticTexts["402"].tap()
        hotelListButton.tap()
        app.navigationBars["Hotel List"].buttons["Sort&Filter"].tap()
        XCUIApplication().navigationBars["Hotel List"].buttons["Sort&Filter"].tap()
 
    }
}
