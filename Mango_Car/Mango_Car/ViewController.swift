//
//  ViewController.swift
//  Mango_Car
//
//  Created by Edgar Mayorga on 03/11/16.
//  Copyright © 2016 Devma. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        print(mapView.userLocation.coordinate)
        
        let mapRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(0.1, 0.1))
        mapView.region = mapRegion
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        let mapRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(0.1, 0.1))
        mapView.setRegion(mapRegion, animated: true)
    }

    @IBAction func mostrarButtonTapped() {
        performSegue(withIdentifier: "MostrarSecondID", sender: self)
    }

}

