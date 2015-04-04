//
//  MapViewController.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataBase.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) Statues* data;
@property (nonatomic) NSInteger selectedPin;
@property (nonatomic, strong) NSString* selectedPinName;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)close:(UIButton *)sender;

- (void) initPins;
- (void) scrollToPinWithId:(NSInteger) sId;

@end
