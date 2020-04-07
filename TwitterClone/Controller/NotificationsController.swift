//
//  NotificationController.swift
//  TwitterClone
//
//  Created by dj on 2020/04/07.
//  Copyright © 2020 DJ. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
    // MARK: - Properties
    
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
       
        navigationItem.title = "Notifications"
        
    }
}
