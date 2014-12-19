//
//  WeatherDisplayController.h
//  WeatherDisplay
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDisplayController : UIViewController

@property (nonatomic, strong) NSString *cityId;

- (instancetype) initWithCityId:(NSString *)cityId;

@end
