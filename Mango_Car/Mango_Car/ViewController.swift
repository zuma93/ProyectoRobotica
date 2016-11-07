//
//  ViewController.swift
//  Mango_Car
//
//  Created by Edgar Mayorga on 03/11/16.
//  Copyright © 2016 Devma. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mostrarButtonTapped() {
        performSegue(withIdentifier: "MostrarSecondID", sender: self)
    }

}

