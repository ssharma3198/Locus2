//
//  loginViewController.swift
//  Locus
//
//  Created by limao on 7/6/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    
   
    
    @IBAction func loginTapped(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "isuserLoggedin")
        self.dismiss(animated: true, completion: nil)
              
    }
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
