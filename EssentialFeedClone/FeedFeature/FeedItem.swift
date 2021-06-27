//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by kshitij gupta on 05/06/21.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: String
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: String, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
