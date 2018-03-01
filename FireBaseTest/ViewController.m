//
//  ViewController.m
//  FireBaseTest
//
//  Created by Jason on 2018/3/1.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;
@import UIKit;

@interface ViewController ()
@property(nonatomic, strong) GADInterstitial*interstitial;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.interstitial = [[GADInterstitial alloc]
                         initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
    GADRequest *request = [GADRequest request];
    request.testDevices = @[kGADSimulatorID];
    [self.interstitial loadRequest:request];
    
}
- (IBAction)Showmead:(UIButton *)sender {
    NSLog(@"Show me ad");
    if (self.interstitial.isReady){
        [self.interstitial presentFromRootViewController:self];
    }
    else{
        GADRequest *request = [GADRequest request];
        request.testDevices = @[kGADSimulatorID];
        [self.interstitial loadRequest:request];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
