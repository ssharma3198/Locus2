//
//  ViewController.swift
//  Locus
//
//  Created by limao on 7/6/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    // var mylocation = MKPointAnnotation()
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
       
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
        
      
        
    }

    @IBAction func stopLocate(_ sender: Any) {
        manager.stopUpdatingLocation()
    }
    
    
    @IBAction func locateMe(_ sender: Any) {
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
        let myUrl = URL(string: "http://rovermind.cs.umd.edu:8080/LocationServer/FindLocation?type=ap");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString2 = "<?xml version=\"1.0\"?><data><deviceid>65738392137234</deviceid><accesspoints><accesspoint><name>umd</name><mac>00:81:c4:1e:09:7f</mac><signal>-58</signal><freq>5765</freq></accesspoint></accesspoints></data>";
        
        request.httpBody = postString2.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            // JSONSerialization
            
            if error != nil
                
            {
                print(error)
                return
            }
            
            // You can print out response object
            print(response)
            
            let responseString = String(data: data!,encoding: String.Encoding.utf8)
            
            print(responseString!)
       
//            let mylocationCoordinate = CLLocationCoordinate2DMake(38.989697, -76.937760)
//            self.mylocation.coordinate = mylocationCoordinate
//            self.mylocation.title = (responseString)
//            self.map.addAnnotation(self.mylocation)
            
        }
        
        task.resume()
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.applicationIconBadgeNumber = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool){
        
        let isuserLoggedin = UserDefaults.standard.bool(forKey: "isuserLoggedin")
        
        if (!isuserLoggedin){
            self.performSegue(withIdentifier: "loginView",sender: self)
        }
    }
    
    
    
}

