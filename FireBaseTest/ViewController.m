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

// + banner ad
@property(nonatomic, strong) GADBannerView *bannerView;

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
    
    //+ banner ad
    // In this case, we instantiate the banner with desired ad size.
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:self.bannerView];
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
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


//+ banner ad
- (void)addBannerViewToView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomLayoutGuide
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
