//
//  DataBase.m
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import "DataBase.h"

static DataBase* sDataBase;

@implementation DataBase

+ (instancetype) defaultDataBase
{
    if(!sDataBase)
    {
        sDataBase = [DataBase new];
        NSError* err = NULL;
        NSURL* url = [[NSURL alloc] initWithString:@"http://slylama.com/lenin/json.php"];
        NSString* json = [[NSString alloc] initWithContentsOfURL:url encoding:4 error:&err];
        sDataBase.data = [[Statues alloc] initWithString:json error:&err];
    }
    return sDataBase;
}

@end
