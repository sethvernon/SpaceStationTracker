//
//  CustomAnnotation.m
//  ISS_LocationTracker
//
//  Created by Seth A. Vernon on 9/14/15.
//  Copyright (c) 2015 Seth A. Vernon. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation


- (instancetype)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    
    if (self)
    {
        self.coordinate = coord;
    }
    
    return self;
}


- (CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}


@end
