//
//  DetailViewController.h
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;

@interface DetailViewController : UIViewController

//Функция проброса данных с другой вьюхи
- (void) reciveData:(NSArray*) array fromView:(UIViewController*) viewController;
- (void) resetData;

@property (strong, nonatomic) DataModel* data;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *statuesTitle;
@property (weak, nonatomic) IBOutlet UITextView *statuesDescription;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)actionShowOnMap:(UIButton *)sender;
@end
