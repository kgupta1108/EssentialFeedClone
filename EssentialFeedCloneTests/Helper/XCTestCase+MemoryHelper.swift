//
//  XCTestCase+MemoryHelper.swift
//  EssentialFeedTests
//
//  Created by kshitij gupta on 15/06/21.
//

import XCTest

extension XCTestCase {
    func checkForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential Memory leak", file: file, line: line)
        }
    }
}
