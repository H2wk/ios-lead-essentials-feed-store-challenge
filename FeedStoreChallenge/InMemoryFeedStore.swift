//
//  InMemoryFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Joyce, Andrew on 24/03/2020.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation

class InMemoryFeedStore : FeedStore {
    private var feed: [LocalFeedImage]?
    private var timestamp : Date?
    
    func deleteCachedFeed(completion: @escaping InMemoryFeedStore.DeletionCompletion) {
        self.feed = nil
        timestamp = nil
        completion(.none)
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InMemoryFeedStore.InsertionCompletion) {
        self.feed = feed
        self.timestamp = timestamp
        completion(.none)
    }
    
    func retrieve(completion: @escaping InMemoryFeedStore.RetrievalCompletion) {
        guard let _feed = self.feed, let _timestamp = timestamp else {
            return completion(.empty)
        }
        completion(.found(feed: _feed, timestamp: _timestamp))
    }
}
