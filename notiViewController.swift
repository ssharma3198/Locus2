//
//  notiViewController.swift
//  Locus
//
//  Created by limao on 7/19/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit
import UserNotifications

class notiViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let hoursArr = Array(0...23)
    let minArr = Array(0...59)
    var timer = false
    var hour = 0
    var minute = 0
    
    
    @IBOutlet weak var action: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        UIApplication.shared.applicationIconBadgeNumber = 0
        action.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var hoursSelected = 0
    var minutesSelected = 1
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(hoursArr[row])
        }
        else {
            return String(minArr[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return hoursArr.count
        } else {
            return minArr.count
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            hoursSelected = hoursArr[row]
            hour = hoursArr[row]
        } else {
            minutesSelected = minArr[row]
            minute = minArr[row]
        }
    }
    
    
    @IBAction func settime(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to set this time?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            self.timer = true
        }))
        alert.addAction((UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (cancel) in
            print ("cancel")
            self.timer = false
        })))
        self.present(alert, animated: true, completion: nil)
        
        if (timer == true){
            let content = UNMutableNotificationContent()
            
            
            content.title = NSString.localizedUserNotificationString(forKey: "How are you feeling today!",    arguments: nil)
            
            content.body = NSString.localizedUserNotificationString(forKey: "Leave your feedback",
                                                                    arguments: nil)
            
            content.badge = 1
            
            content.sound = UNNotificationSound.default()
            
            
            var dateInfo = DateComponents()
            
            dateInfo.hour = hour
            print(hour)
            
            dateInfo.minute = minute
            print(minute)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
            
            // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        
    }
    
}





