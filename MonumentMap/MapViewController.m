//
//  MapViewController.m
//  MonumentMap
//
//  Created by Andrew Medvedev on 01.03.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"
#import "ViewController.h"
#import "Pin.h"
#import "Annotation.h"

@implementation MapViewController

//-----------------------------------------------------------------------
- (void) viewDidLoad
{
    [super viewDidLoad];
    _data = [DataBase defaultDataBase].data;
    
    [self initPins];
    _closeButton.hidden = YES;
}

//-----------------------------------------------------------------------
- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
    _closeButton.hidden = YES;
}

- (void) initPins
{
    NSInteger count = _data.statues.count;
    for(int i = 0; i < count; i++)
    {
        DataModel* data = [_data.statues objectAtIndex:i];
        Pin* pin = [[Pin alloc ]initPinWithTitle:data.title AndCoordinate:[self parseCoordinateWithString:data.coordinates] AndId:data.id];
        [_map addAnnotation:pin];
    }
}

//-----------------------------------------------------------------------
- (CLLocationCoordinate2D) parseCoordinateWithString:(NSString*) coord
{
    CLLocationCoordinate2D components;
    NSRange range = [coord rangeOfString:@","];
    NSString* cLant = [coord substringWithRange:NSMakeRange(0, range.location)];
    NSString* cLong = [coord substringFromIndex:range.location+1];
    
    components.latitude = cLant.floatValue;
    components.longitude = cLong.floatValue;
    
    return components;
}

//-----------------------------------------------------------------------
- (MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* sid = @"Id";
    Pin* pin = (Pin*) annotation;
    Annotation* view = (Annotation*)[mapView dequeueReusableAnnotationViewWithIdentifier:sid];
    if(!view)
    {
        view = [[Annotation alloc] initWithAnnotation:annotation reuseIdentifier:sid];
        view.canShowCallout = YES;
        view.pinColor = MKPinAnnotationColorRed;
        view.sId  = pin.pinId;
        
        UIButton* info = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.rightCalloutAccessoryView = info;
    }
    return view;
}

//--------------------------------------------------------
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
{
    Annotation* ann = (Annotation*) view;
    for(int i = 0; i < _data.statues.count; i++)
    {
        DataModel* data = [_data.statues objectAtIndex:i];
        if(!data)
            return;
        
        if(data.id == ann.sId)
        {
            UIStoryboard* mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            DetailViewController* detail = [mainSB instantiateViewControllerWithIdentifier:@"Detail"];

            [self presentViewController:detail animated:YES completion:nil];
            UINavigationBar* bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
            UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:data.title];
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
            [button setImage:[UIImage imageNamed:@"signpost@2x.png"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClicked)
             forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]
                                           initWithCustomView:button];
            
            item.leftBarButtonItem = buttonItem;
            
            [bar pushNavigationItem:item animated:YES];
            [detail.view addSubview:bar];
            [detail reciveData:[NSArray arrayWithObjects:data, nil] fromView:self];
            [detail resetData];
        }
    }
}

- (void) buttonClicked
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void) scrollToPinWithId:(NSInteger)sId
{
    DataModel* data = NULL;
    for(int i = 0; i < _data.statues.count; i++)
    {
        data = [_data.statues objectAtIndex:i];
        if(!data)
            return;
        
        if(data.id == sId)
            break;
    }
    MKMapRect zoomRect = MKMapRectNull;
    MKMapPoint annotationPoint = MKMapPointForCoordinate([self parseCoordinateWithString:data.coordinates]);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
    zoomRect = MKMapRectUnion(zoomRect, pointRect);
    [_map setVisibleMapRect:zoomRect animated:YES];
}

@end
