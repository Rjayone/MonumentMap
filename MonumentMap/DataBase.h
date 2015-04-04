//
//  DataBase.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@interface DataBase : NSObject

+ (instancetype) defaultDataBase;
@property (strong, nonatomic) Statues* data;

@end
