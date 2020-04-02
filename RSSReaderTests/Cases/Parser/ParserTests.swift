//
//  ParserTests.swift
//  RSSReaderTests
//
//  Created by Geonseok Lee on 2020/04/02.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import XCTest
import Combine
@testable import RSSReader

class ParserTests: XCTestCase {
	
	var sut: FeedParser!
	var subscriptions = Set<AnyCancellable>()

    override func setUp() {
		super.setUp()
		sut = FeedParser()
    }

    override func tearDown() {
		sut = nil
		subscriptions.removeAll()
		super.tearDown()
    }
	
	func test_feeds_givenEmptyContent_emptyFeeds() {
		// given
		var result: [Feed] = []
		
		// when
		sut.feeds(contents: "")
			.sink(receiveValue: { feeds in
				result = feeds
			})
			.store(in: &subscriptions)
		
		// then
		XCTAssertTrue(result.isEmpty)
	}

}
