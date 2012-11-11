//
//  MELscrollViewViewController.m
//  MELscrollView
//
//  Created by Azam Malik on 11/10/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import "MELscrollViewViewController.h"

@interface MELscrollViewViewController ()

@end

@implementation MELscrollViewViewController

@synthesize view1, view2, view3, view4, carMakes;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.carMakes = [NSMutableArray array];
	
    [carMakes addObject:@"mike"]; [carMakes addObject:@"john"]; [carMakes addObject:@"tom"]; [carMakes addObject:@"gene"]; [carMakes addObject:@"lorenzo"]; [carMakes addObject:@"gabriel"];
    
    
    
    NSInteger numberOfViews = 3;
    
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * view1.frame.size.width;
        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
        awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
        [view1 addSubview:awesomeView];
    }
    
    view1.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
    
    UIView *awesomeView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 500)];
    awesomeView2.backgroundColor = [UIColor colorWithRed:0.5/2 green:0.5 blue:0.5 alpha:1];
    [view2 addSubview:awesomeView2];
    
    [self.view4 reloadData];
    self.view4.delegate = self;
    self.view4.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [carMakes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *cellData = [carMakes objectAtIndex:indexPath.row];
    cell.textLabel.text = cellData;
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}
@end
