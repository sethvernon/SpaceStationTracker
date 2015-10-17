//
//  ViewController.swift
//  SpaceStationTracker
//
//  Created by Seth on 10/13/15.
//  Copyright (c) 2015 Seth A. Vernon. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate  {

    
    @IBOutlet weak var mapView: MKMapView!
        {
        didSet {
            mapView.delegate = self
            mapView.mapType = .Satellite
            
        }
    }
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longitude: UILabel!
    
    
    @IBOutlet weak var mapTypeButt: UISegmentedControl!
    
    @IBAction func mapType(sender: UISegmentedControl) {
        
        var index = Int()
        index = mapTypeButt.selectedSegmentIndex
        
        switch index {
            
        case 0: mapView.mapType = .Satellite
            
        case 1: mapView.mapType = .Standard
            
        case 2:  mapView.mapType = .Hybrid
            
        default: break
            
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
   
        
    
    
       
    
    
    
    
    
}

