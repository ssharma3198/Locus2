//
//  logoutViewController.swift
//  Locus
//
//  Created by limao on 7/7/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit

class logoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
