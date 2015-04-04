//
//  DetailViewController.m
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import "DetailViewController.h"
#import "DataModel.h"
#import "MapViewController.h"

@implementation DetailViewController

//--------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetData];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

//--------------------------------------------------------------------------------
- (void) reciveData:(NSArray*) array fromView:(UIViewController*) viewController
{
    _data = [array objectAtIndex:0];
}

//--------------------------------------------------------------------------------
- (void) resetData
{
    if(!_data)
        return;
    
    _statuesTitle.text = _data.title;
    _statuesDescription.text = _data.description;
    
    NSData* img = [NSData dataWithContentsOfURL:[NSURL URLWithString:_data.image]];
    UIImageView* imgView = [_image initWithImage:[UIImage imageWithData:img]];
    imgView.image = [self ScaleImgPropoWidth:imgView.image scaledToSize:CGSizeMake(320, 170)];
}

- (IBAction)actionShowOnMap:(UIButton *)sender
{
    UIStoryboard* mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapViewController* map = [mainSB instantiateViewControllerWithIdentifier:@"Map"];
    
    if(!map)
        return;
    
    [self presentViewController:map animated:YES completion:NULL];
    map.closeButton.hidden = NO;
    [map scrollToPinWithId:_data.id];
}

- (UIImage *)ScaleImgPropoWidth:(UIImage *)image scaledToSize:(CGSize)newSize {
    CGFloat ratio = newSize.height / image.size.height;
    UIImage *scaledImage = [UIImage imageWithCGImage:[image CGImage] scale:(image.scale / ratio) orientation:(image.imageOrientation)];
//    CGRect clipRect = CGRectMake(0, 0, scaledImage.size.width, scaledImage.size.height);
//    CGSize sz = CGSizeMake(newSize.width, scaledImage.size.height);
//    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
//        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
//    } else {
//        UIGraphicsBeginImageContext(sz);
//    }
//    UIRectClip(clipRect);
//    [image drawInRect:clipRect];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
