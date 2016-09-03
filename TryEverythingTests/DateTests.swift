//
//  DateTests.swift
//  Playground
//
//  Created by allenlinli on 9/3/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNextDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .long
        
        var dateComponents = DateComponents()
        dateComponents.minute = 0
        //dateComponents.second = 0
        
        let beginDate = Date(timeIntervalSince1970: 190)
        var beginDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: beginDate)
        beginDateComponents.minute = 0
        beginDateComponents.second = 0
        let modifiedDate = Calendar.current.date(from: beginDateComponents)!
        
        let nextHourlyTime = Calendar.current.nextDate(after: modifiedDate, matching: dateComponents, matchingPolicy: .nextTime)!
        
        print("modifiedDate: \(dateFormatter.string(from: modifiedDate))")
        print("beginDate: \(dateFormatter.string(from: beginDate))")
        print("nextHourlyTime: \(dateFormatter.string(from: nextHourlyTime))")
        /*
         modifiedDate: 1/1/70, 10:00:00 AM GMT+10
         beginDate: 1/1/70, 10:03:10 AM GMT+10
         nextHourlyTime: 1/1/70, 11:00:00 AM GMT+10
         */
        
        let nextHourlyTimeString = dateFormatter.string(from: nextHourlyTime)
        
        XCTAssert("1/1/70, 11:00:00 AM GMT+10" == nextHourlyTimeString)
    }
    
    func testNextDateFail() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .long
        
        var dateComponents = DateComponents()
        dateComponents.minute = 0
        dateComponents.second = 0 // Fail because of here
        
        let beginDate = Date(timeIntervalSince1970: 190)
        var beginDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: beginDate)
        beginDateComponents.minute = 0
        beginDateComponents.second = 0
        let modifiedDate = Calendar.current.date(from: beginDateComponents)!
        
        let nextHourlyTime = Calendar.current.nextDate(after: modifiedDate, matching: dateComponents, matchingPolicy: .nextTime)!
        
        let nextHourlyTimeString = dateFormatter.string(from: nextHourlyTime)
        
        XCTAssert("1/1/70, 11:00:00 AM GMT+10" == nextHourlyTimeString)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
