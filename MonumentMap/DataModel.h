//
//  DataModel.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 26.02.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//
//http://slylama.com/lenin/json.php

#import <Foundation/Foundation.h>
#import "JSONModel/JSONModel.h"

@protocol DataModel
@end

@interface DataModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* coordinates;
@end

@interface Statues : JSONModel
@property (strong, nonatomic) NSArray<DataModel>* statues;

@end
