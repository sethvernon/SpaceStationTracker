//
//  SpaceStation_AnnotationView.swift
//  ISS_LocationTracker
//  Created by Seth A. Vernon on 9/14/15.
//  Copyright (c) 2015 Seth A. Vernon All rights reserved.
//

import Foundation
import UIKit
import MapKit


// Protocal Declaration
@objc protocol SpaceStation_AnnotationViewDelegate
{
    // might not need this
}

@objc class SpaceStation_AnnotationView: MKAnnotationView
{
    var mapView = MKMapView()
    
    var delegate:SpaceStation_AnnotationViewDelegate?

    
    override init(annotation:MKAnnotation, reuseIdentifier:String)
        {
            super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
            
            // set the image
            let image = UIImage(named:"spaceStation.png")!
                   self.frame = CGRectMake(0, 0, image.size.width / 1.5, image.size.height / 1.5)
            
                    self.opaque = false
            
                        }
                            override init(frame: CGRect)
                                {
                                    super.init(frame: frame)
                            }
    
                        required init(coder: NSCoder)
                            {
                                fatalError("NSCoding not supprted")
                        }
    
    
   override func drawRect(rect: CGRect)
                {
                    let image = UIImage(named: "spaceStation.png")!
                    self.frame = CGRectMake(0, 0, image.size.width / 3.0, image.size.height / 3.0)
                    self.centerOffset = CGPointMake( +25, 0 )
                    
                    self.opaque = false
                    
                    image.drawInRect(self.bounds.rectByInsetting(dx: 5, dy: 5))
            }
    
    
}


    