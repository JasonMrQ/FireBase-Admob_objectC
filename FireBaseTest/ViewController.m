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
//    self.interstitial = [[GADInterstitial alloc]
//                         initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
//    GADRequest *request = [GADRequest request];
//    request.testDevices = @[kGADSimulatorID];
//    [self.interstitial loadRequest:request];
    
    self.interstitial =  [self createAndLoadInterstitial];
}

- (GADInterstitial *)createAndLoadInterstitial {
    GADInterstitial *interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    self.interstitial = [self createAndLoadInterstitial];
}

- (IBAction)Showmead:(UIButton *)sender {
    
    if (self.interstitial.isReady){
        [self.interstitial presentFromRootViewController:self];
    }
    else{
        NSLog(@"Ad wasn't ready");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
