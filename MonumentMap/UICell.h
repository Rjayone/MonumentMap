//
//  UICell.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 26.02.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *descr;
@end
