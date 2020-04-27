//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by dj on 2020/04/27.
//  Copyright © 2020 DJ. All rights reserved.
//

import UIKit

enum UploadTweetConfiguration{
    case tweet
    case reply(Tweet)
}


struct UploadTweetViewModel {
    let actionButtonTitle: String
    let placeholderText: String
    var shouldShowReplyLabel: Bool
    var replyText: String?
    
    init(config: UploadTweetConfiguration){
        switch config {
        case .tweet:
            actionButtonTitle = "Tweet"
            placeholderText = "What's Happening?"
            shouldShowReplyLabel = false
        case .reply(let tweet):
            actionButtonTitle = "Reply"
            placeholderText = "Tweet your Reply"
            shouldShowReplyLabel = true
            replyText = "Replying To @\(tweet.user.username)"
        }
    }
}

