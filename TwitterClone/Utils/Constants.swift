//
//  Constants.swift
//  TwitterClone
//
//  Created by dj on 2020/04/09.
//  Copyright © 2020 DJ. All rights reserved.
//

import Foundation
import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

