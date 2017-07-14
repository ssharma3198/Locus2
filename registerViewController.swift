//
//  registerViewController.swift
//  Locus
//
//  Created by limao on 7/6/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var UID: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confPassword: UITextField!
    
   
    
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        
      
        
        
       let userUID = UID.text
       let userphoneNumber = phoneNumber.text
       let userpassword = password.text
       let userconfPassword = confPassword.text
        
        // check to see if any text field is empty
        
        if(userUID!.isEmpty || userphoneNumber!.isEmpty || userpassword!.isEmpty || userconfPassword!.isEmpty){
            
            
            displayAlertMessage(userMassage: "All fields are required")
            
            return;
        }
        
        // check to see if passwords are matching
        
        if(userpassword != userconfPassword){
            
            displayAlertMessage(userMassage:"Passwords do not match")
            return;
            
        }
        
        
        // check UID
        
        
        let Alert = UIAlertController(title: "Congratulation", message: "Registration is completed", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        
        Alert.addAction(okAction)
        self.present(Alert, animated: true, completion: nil)
        
        
    }
    
    
       
    func displayAlertMessage(userMassage:String){
        
        let Alert = UIAlertController(title: "Alert", message: userMassage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        Alert.addAction(okAction)
        
        self.present(Alert, animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
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
