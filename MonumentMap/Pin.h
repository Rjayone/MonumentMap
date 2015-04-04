//
//  Pin.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Pin;

@protocol PinDeleage <NSObject>

- (void) didSelect:(Pin*) pin WithId:(NSInteger) pinId;

@end

//===============================================================
@interface Pin : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic) NSInteger pinId;

- (instancetype) initPinWithTitle:(NSString*) title AndCoordinate:(CLLocationCoordinate2D) coordinate AndId:(NSInteger) pinId;

@end
