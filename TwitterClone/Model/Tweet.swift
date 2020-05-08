//
//  Tweet.swift
//  TwitterClone
//
//  Created by dj on 2020/04/16.
//  Copyright © 2020 DJ. All rights reserved.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetID: String
    var likes: Int
    var timestamp: Date!
    let retweetCount: Int
    var user: User
    var didLike = false

    
    init(user: User, tweetID: String, dictionary: [String: Any]){
        self.user = user
        
        self.tweetID = tweetID
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
