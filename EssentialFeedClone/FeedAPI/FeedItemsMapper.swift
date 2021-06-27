//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by kshitij gupta on 09/06/21.
//

import Foundation

final class FeedItemsMapper {
    private static var OK_200: Int {
        return 200
    }
    
    private struct Root: Decodable {
        let items: [Item]
        
        var feed: [FeedItem] {
            return items.map( { $0.item } )
        }
    }

    private struct Item: Decodable {
        let id: String
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    static func map(_ data: Data, _ response: HTTPURLResponse) -> RemoteFeedLoader.Result  {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        let items = root.feed
        return .success(items)
    }
}
