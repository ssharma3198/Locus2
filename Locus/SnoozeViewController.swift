//
//  SnoozeViewController.swift
//  Locus
//
//  Created by limao on 7/12/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit

class SnoozeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let hoursArr = Array(0...23)
    let minArr = Array(1...59)
    
    @IBOutlet weak var hours: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hours.delegate = self        // Do any additional setup after loading the view.
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
        } else {
            minutesSelected = minArr[row]
        }
    }
    
    @IBAction func snooze(_ sender: UIButton) {
        print ("snoozed for \(hoursSelected):\(minutesSelected)")
    }
    
    @IBAction func forever(_ sender: UIButton) {
        let alert = UIAlertController(title: "Stop Tracking", message: "Are you sure you want to stop tracking", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            print ("stopped tracking")
        }))
        alert.addAction((UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (cancel) in
            print ("No changes")
        })))
        self.present(alert, animated: true, completion: nil)
    }
}
