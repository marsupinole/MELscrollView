//
//  MELscrollViewViewController.m
//  MELscrollView
//
//  Created by Azam Malik on 11/10/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import "MELscrollViewViewController.h"

#define SHOW_MULTIPLE_SECTIONS 1

#define PORTRAIT_WIDTH 768
#define LANDSCAPE_HEIGHT (1024-20)
#define HORIZONTAL_TABLEVIEW_HEIGHT 140
#define VERTICAL_TABLEVIEW_WIDTH 180
#define TABLE_BACKGROUND_COLOR [UIColor clearColor]

#define BORDER_VIEW_TAG 10

#ifdef SHOW_MULTIPLE_SECTIONS
#define NUM_OF_CELLS 10
#define NUM_OF_SECTIONS 2
#else
#define NUM_OF_CELLS 21
#endif

@interface MELscrollViewViewController ()

@end

@implementation MELscrollViewViewController

@synthesize view1, view2, view3, view4, carMakes, verticalView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupVerticalView];
    
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
    
    UITableView *table1 = [[UITableView alloc] initWithFrame:CGRectMake(200, 600, 100, 400)];
    
    //view4.frame = CGRectMake(200, 600, 100, 400);
    
    UIView *awesomeView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 500)];
    awesomeView2.backgroundColor = [UIColor colorWithRed:0.5/2 green:0.5 blue:0.5 alpha:1];
    [view2 addSubview:awesomeView2];
    
    //view4.backgroundColor = [UIColor redColor];
    view2.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    //[self.view4 reloadData];
    view4.delegate = self;
    view4.dataSource = self;
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

- (void)setupVerticalView
{
    CGRect frameRect = CGRectMake(PORTRAIT_WIDTH - VERTICAL_TABLEVIEW_WIDTH, 0, VERTICAL_TABLEVIEW_WIDTH, LANDSCAPE_HEIGHT);
    EasyTableView *view	= [[EasyTableView alloc] initWithFrame:frameRect numberOfRows:NUM_OF_CELLS ofHeight:HORIZONTAL_TABLEVIEW_HEIGHT];
    self.verticalView = view;
    
    verticalView.delegate = self;
    verticalView.tableView.backgroundColor	= TABLE_BACKGROUND_COLOR;
    verticalView.tableView.allowsSelection	= YES;
    verticalView.tableView.separatorColor	= [[UIColor blackColor] colorWithAlphaComponent:0.1];
    verticalView.cellBackgroundColor	= [[UIColor blackColor] colorWithAlphaComponent:0.1];
    verticalView.autoresizingMask	= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Allow verticalView to scroll up and completely clear the horizontalView
    verticalView.tableView.contentInset	= UIEdgeInsetsMake(0, 0, HORIZONTAL_TABLEVIEW_HEIGHT, 0);
    
    [self.view addSubview:verticalView];
}

//optional methods for having multiple sections
//- (NSUInteger)numberOfSectionsInEasyTableView:(EasyTableView*)easyTableView
//{
//    return NUM_OF_SECTIONS;
//}
//
//-(NSUInteger)numberOfCellsForEasyTableView:(EasyTableView *)view inSection:(NSInteger)section
//{
//    return NUM_OF_CELLS;
//}

- (UIView *)easyTableView:(EasyTableView *)easyTableView viewForRect:(CGRect)rect
{
    CGRect labelRect = CGRectMake(10, 10, rect.size.width-20, rect.size.height-20);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    label.textAlignment	= UITextAlignmentCenter;
    label.textColor	= [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:60];
    
    label.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.3];
    
    UIImageView *borderView	= [[UIImageView alloc] initWithFrame:label.bounds];
    borderView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    borderView.tag	= BORDER_VIEW_TAG;
    
    [label addSubview:borderView];
    
    return label;
}

// Second delegate populates the views with data from a data source

- (void)easyTableView:(EasyTableView *)easyTableView setDataForView:(UIView *)view forIndexPath:(NSIndexPath *)indexPath
{
    UILabel *label	= (UILabel *)view;
    label.text	= [NSString stringWithFormat:@"%i", indexPath.row];
    
    // selectedIndexPath can be nil so we need to test for that condition
    BOOL isSelected = (easyTableView.selectedIndexPath) ? ([easyTableView.selectedIndexPath compare:indexPath] == NSOrderedSame) : NO;
    //[self borderIsSelected:isSelected forView:view];
}


@end
