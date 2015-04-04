//
//  ViewController.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 26.02.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Statues* data;
@end

