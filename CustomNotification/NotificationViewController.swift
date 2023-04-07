//
//  NotificationViewController.swift
//  CustomNotification
//
//  Created by Sparkout on 07/04/23.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        UserDefaults(suiteName: "dfsf.dfsdf.dsfsdf")
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
