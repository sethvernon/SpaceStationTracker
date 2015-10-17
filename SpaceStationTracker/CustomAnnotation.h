//
//  CustomAnnotation.h
//  ISS_LocationTracker
//
//  Created by Seth A. Vernon on 9/14/15.
//  Copyright (c) 2015 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface CustomAnnotation : NSObject <MKAnnotation>


@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithLocation:(CLLocationCoordinate2D)coordinate;

@end
