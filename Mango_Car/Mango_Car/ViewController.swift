//
//  ViewController.swift
//  Mango_Car
//
//  Created by Edgar Mayorga on 03/11/16.
//  Copyright © 2016 Devma. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mySwitch: UISwitch!
    var trackingGPS = true
    
    @IBAction func switchTapped() {
        trackingGPS = mySwitch.isOn
    }
    
    
    @IBAction func longPressRecognized(_ sender: UILongPressGestureRecognizer) {
//        print(sender)
        let viewCoordinate = sender.location(in: mapView)
        let mapCoordinate = mapView.convert(viewCoordinate, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapCoordinate
        annotation.title = "Touch"
        sender.isEnabled = false
        mapView.addAnnotation(annotation)
        sender.isEnabled = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let _ = annotation as? MKUserLocation {
            return nil
        }
        else
        {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MY Pin Reuse ID")
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "MostrarSecondID", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
       // print(mapView.userLocation.coordinate)
        
        let mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.40907985145731, longitude: -99.180971328193905), span: MKCoordinateSpanMake(0.005, 0.005))
        mapView.region = mapRegion
        mapView.delegate = self
        
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
        if trackingGPS
        {
            let mapSpan = mapView.region.span
            let mapRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: mapSpan)
            mapView.setRegion(mapRegion, animated: true)
        }
    }

    @IBAction func mostrarButtonTapped() {
        performSegue(withIdentifier: "MostrarSecondID", sender: self)
    }

}

