//
//  ViewModel.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/16.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import Combine
import Foundation
import SwiftSoup

class FeedsViewModel: ObservableObject {

	/// 타켓 URL
	private var url: URL
	/// Subscriptions 저장소
	private var subscriptions = Set<AnyCancellable>()
	/// parsing 결과 저장
	@Published var allFeeds = [Feed]()

	var parser = FeedParser()

	init(url: URL) {
		self.url = url
		parse()
	}

	/// 타켓 URL로부터 파싱해서
	/// allFeeds 변수에 저장
	func parse() {
		let contents = try! String(contentsOf: self.url)
		self.allFeeds = []
		parser
			.feeds(contents: contents)
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { completion in
				if case .failure(let error) = completion {
					print("error", error)
				}
			}, receiveValue: { feeds in
				self.allFeeds = feeds
			})
			.store(in: &subscriptions)
	}
}
