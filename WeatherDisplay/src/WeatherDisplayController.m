//
//  WeatherDisplayController.m
//  WeatherDisplay
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "WeatherDisplayController.h"
#import <WeatherAPI.h>
#import <Weather.h>

@interface WeatherDisplayController ()

@property (weak, nonatomic) IBOutlet UILabel *weatherTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherUpdateTimeLabel;

@end

@implementation WeatherDisplayController

- (instancetype)initWithCityId:(NSString *)cityId {
    if (self = [super init]) {
        _cityId = cityId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[WeatherAPI sharedAPI] updateWeatherWithCityId:_cityId completedBlock:^(Weather *weather, NSError *error) {
        if (error) {
            self.title = @"出错了";
            [[[UIAlertView alloc] initWithTitle:@"出错了" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil] show];
        } else {
            if (weather.city) {
                self.title = weather.city;
            } else {
                self.title = @"未找到";
            }
        }
        
        [_weatherTempLabel setText:[NSString stringWithFormat:@"%@ ℃", weather.temp]];
        [_weatherUpdateTimeLabel setText:weather.updateTime];
    }];
    
    self.title = @"更新中...";
    
    if (self.navigationController.viewControllers.count == 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    }
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
