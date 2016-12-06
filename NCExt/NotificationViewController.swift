//
//  NotificationViewController.swift
//  NCExt
//
//  Created by Kuan on 12/5/16.
//  Copyright © 2016 Kuan. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        print("UNNotificationContentExtension viewDidLoad")

    }
    
    func didReceive(_ notification: UNNotification) {
        print("UNNotificationContentExtension didReceive")
        self.label?.text = notification.request.content.body

    }

}
