//
//  CurrencyModel.h
//  CurrencyApp
//
//  Created by Seth Vernon on 1/26/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpaceStationModel : NSObject

+ (void)loadJSONDataWithCompletion:(void (^)(NSDictionary *))completion;

@end
