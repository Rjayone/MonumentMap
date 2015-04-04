//
//  Pin.m
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import "Pin.h"

@implementation Pin

- (instancetype) initPinWithTitle:(NSString*) title AndCoordinate:(CLLocationCoordinate2D) coordinate AndId:(NSInteger) pinId
{
    self = [super init];
    _title = title;
    _coordinate = coordinate;
    _pinId = pinId;
    
    return self;
}

@end
