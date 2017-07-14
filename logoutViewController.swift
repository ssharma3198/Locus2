//
//  logoutViewController.swift
//  Locus
//
//  Created by limao on 7/7/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit
import UserNotifications

class logoutViewController: UIViewController{
    
    
    
    @IBAction func notification(_ sender: Any) {
    
       
        let content = UNMutableNotificationContent()
    
    
        content.title = NSString.localizedUserNotificationString(forKey: "How are you feeling today!",    arguments: nil)
    
        content.body = NSString.localizedUserNotificationString(forKey: "Leave your feedback",
            arguments: nil)
        
        content.badge = 1
        
        content.sound = UNNotificationSound.default()
    
        
        var dateInfo = DateComponents()
        
        dateInfo.hour = 16
        
        dateInfo.minute = 0
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        UIApplication.shared.applicationIconBadgeNumber = 0
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isuserLoggedin")
        self.tabBarController!.selectedIndex = 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
