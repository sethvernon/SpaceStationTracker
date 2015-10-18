//
//  CurrencyModel.m
//  CurrencyApp
//
//  Created by Seth Vernon on 1/26/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import "SpaceStationModel.h"

@interface SpaceStationModel()


@end

@implementation SpaceStationModel


+ (void)loadJSONDataWithCompletion:(void (^)(NSDictionary *))completion
{
    
    NSURL *url = [NSURL URLWithString:@"http://api.open-notify.org/iss-now.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments error:&connectionError];
         
         NSLog(@"RESULTS: %@", results);
        

       NSDictionary *locationDictionary = [results objectForKey:@"iss_position"];
        
        
         completion(locationDictionary);

     }];
    
}

@end
