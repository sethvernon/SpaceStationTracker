//
//  ViewController.swift
//  SpaceStationTracker
//
//  Created by Seth on 10/13/15.
//  Copyright (c) 2015 Seth A. Vernon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate
{

    
            @IBOutlet weak var mapView: MKMapView! {
                didSet {
                    mapView.delegate = self
                    mapView.mapType = .Satellite
                }
            }
            @IBOutlet weak var latitudeLabel: UILabel!
            @IBOutlet weak var longitude: UILabel!
            @IBOutlet weak var mapTypeButt: UISegmentedControl!
            @IBAction func mapType(sender: UISegmentedControl)
            {
                var index = Int()
                index = mapTypeButt.selectedSegmentIndex
                switch index {
                    
                case 0: mapView.mapType = .Satellite
                case 1: mapView.mapType = .Standard
                case 2:  mapView.mapType = .Hybrid
                    
                default: break
                    
                }
            }
            lazy var spaceStationModel = SpaceStationModel()
            lazy var customAnnotation = CustomAnnotation()
            var spaceStationCoordinates = NSDictionary()
            var startCoordinate = CLLocationCoordinate2D()
            var activityIndicator = UIActivityIndicatorView()
            var currentLatitude = Double?()
            var currentLongitude = Double?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        loadData()
        
        
    }
    private func loadData() {
        
        SpaceStationModel.loadJSONDataWithCompletion { (locationDictionary) in
            
            self.spaceStationCoordinates = locationDictionary as NSDictionary
            
            self.currentLatitude = self.spaceStationCoordinates.valueForKey("latitude")?.doubleValue
            self.currentLongitude = self.spaceStationCoordinates.valueForKey("longitude")?.doubleValue
            
            self.latitudeLabel.text = "\(self.currentLatitude)"
            self.longitude.text = "\(self.currentLongitude)"
            
            var newCoordinate = CLLocationCoordinate2DMake(self.currentLatitude!, self.currentLongitude!)
            
            self.customAnnotation.coordinate = newCoordinate
        }
    }
    
       
    
    
    
    
    
}

