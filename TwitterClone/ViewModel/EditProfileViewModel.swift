//
//  EditProfileViewModel.swift
//  TwitterClone
//
//  Created by jb on 2020/05/18.
//  Copyright © 2020 DJ. All rights reserved.
//

import Foundation

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio
    
    var description: String {
        switch self {
        case .username : return "username"
        case .fullname : return "name"
        case .bio : return "bio"
        }
    }
}
