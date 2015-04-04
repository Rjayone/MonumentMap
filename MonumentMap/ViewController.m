//
//  ViewController.m
//  MonumentMap
//
//  Created by Andrew Medvedev on 26.02.15.
//  Copyright (c) 2015 Andrew Medvedev. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "UICell.h"
#import "DetailViewController.h"
#import "DataBase.h"

@implementation ViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [DataBase defaultDataBase].data;
}

//------------------------------------------------------------------------------
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.statues.count;
}

//------------------------------------------------------------------------------
- (UICell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    
    UICell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(!cell)
        return NULL;
    
    DataModel* model =[_data.statues objectAtIndex:index];
    cell.name.text  = model.title;
    cell.descr.text = model.description;
    
    return cell;
}

//------------------------------------------------------------------------------
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController* view = segue.destinationViewController;
    UICell* cell = (UICell*)sender;
    NSIndexPath* pathOfTheCell = [_tableView indexPathForCell:cell];
    NSInteger selectedRow = pathOfTheCell.row;
    
    if ([segue.identifier isEqualToString:@"MoreInfo"])
    {
        DataModel* data = [_data.statues objectAtIndex:selectedRow];
        NSArray* array = [[NSArray alloc] initWithObjects: data, NULL];
        [view reciveData:array fromView:self];
    }
}
@end
