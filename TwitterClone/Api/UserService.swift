//
//  UserService.swift
//  TwitterClone
//
//  Created by dj on 2020/04/15.
//  Copyright © 2020 DJ. All rights reserved.
//

import Firebase

class UserService{
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
