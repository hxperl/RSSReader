//
//  Feed.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/16.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import Foundation

struct Feed: Identifiable {
	let id = UUID()
	let title: String
	let thumbnailURL: URL
	let description: String
	let link: URL	// Self address
	let keywords: [String]
	
	
	/// Preview 실행을 위한 메소드
	static func generator() -> Feed {
		return Feed(title: "title", thumbnailURL: URL(string: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")!, description: "description", link: URL(string: "")!, keywords: ["abc", "def", "zxc"])
	}
}
