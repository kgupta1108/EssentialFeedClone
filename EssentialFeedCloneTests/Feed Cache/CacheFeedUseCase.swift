//
//  CacheFeedUseCase.swift
//  EssentialFeedCloneTests
//
//  Created by kshitij gupta on 14/07/21.
//

import XCTest
import EssentialFeedClone

class LocalFeedLoader {
    private let store: FeedStore
    init(store: FeedStore) {
        self.store = store
    }
    
    func save(_ items: [FeedItem]) {
        store.deleteCacheFeed()
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
    
    func deleteCacheFeed() {
        deleteCachedFeedCallCount += 1
    }
}

class CacheFeedUseCase: XCTestCase {
    func test_init_doesNotdeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
    func test_save_requestCacheDeletion() {
        let store = FeedStore()
        let localFeedLoader = LocalFeedLoader(store: store)
        let items = [uniqueItem(), uniqueItem()]
        localFeedLoader.save(items)
        XCTAssertEqual(store.deleteCachedFeedCallCount, 1)
    }
    
    //MARK: Helpers
    
    private func uniqueItem() -> FeedItem {
        return FeedItem(id: UUID().uuidString, description: "any", location: "any", imageURL: anyUrl())
    }
    
    private func anyUrl() -> URL {
        return URL(string: "http://any-url.com")!
    }
}
