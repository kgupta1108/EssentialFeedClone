//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by kshitij gupta on 10/06/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping ((LoadFeedResult) -> Void))
}
