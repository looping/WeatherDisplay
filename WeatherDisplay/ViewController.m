//
//  ViewController.m
//  WeatherDisplay
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "ViewController.h"
#import "WeatherDisplayController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[WeatherDisplayController alloc] initWithCityId:@"101210101"]] animated:YES completion:nil];
}
@end
