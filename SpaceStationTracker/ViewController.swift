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
    
            var newCoordinate = CLLocationCoordinate2DMake(Double(), Double())
            var spaceStationCoordinates = NSDictionary()
            var startCoordinate = CLLocationCoordinate2D()
            var activityIndicator = UIActivityIndicatorView()
            var mapLoaded = Bool()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        loadData()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self,
                                                            selector: "loadData",
                                                            userInfo: nil,
                                                             repeats: true)
        
    }
    
    
    
    func setupAnnotation() {
        
        mapView.addAnnotation(customAnnotation)
        mapView.setCenterCoordinate(customAnnotation.coordinate, animated: true)
    }
    
    
    
    
    func loadData() {
        
        SpaceStationModel.loadJSONDataWithCompletion { (locationDictionary) in
            
            self.spaceStationCoordinates = locationDictionary as NSDictionary
            
            var currentLatitude = self.spaceStationCoordinates.valueForKey("latitude")!.doubleValue
            var currentLongitude = self.spaceStationCoordinates.valueForKey("longitude")!.doubleValue
            
            self.latitudeLabel.text = "\(currentLatitude)"
            self.longitude.text = "\(currentLongitude)"
            
            self.customAnnotation.coordinate = CLLocationCoordinate2DMake(currentLatitude, currentLongitude)
            
            self.setupAnnotation()
            
//            if self.mapLoaded == false   {
//                
//                self.setupAnnotation()
//                
//                self.mapLoaded = true
//            }
            

        }
    }
    
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        let reuseIdentifier = "ISS"
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier)
        
        
        if annotation.isKindOfClass(CustomAnnotation) {
            
            annotationView = SpaceStation_AnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            
            annotationView.canShowCallout = true
            customAnnotation.title = "ISS Postion"
            customAnnotation.subtitle = ""

            
            annotationView.annotation = annotation


            
        }
        
        return annotationView
    }
    
    


}
    
    
    
    
    
    
    
    
    


