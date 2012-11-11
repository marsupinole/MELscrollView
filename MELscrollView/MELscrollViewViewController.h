//
//  MELscrollViewViewController.h
//  MELscrollView
//
//  Created by Azam Malik on 11/10/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MELscrollViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *view1;
@property (weak, nonatomic) IBOutlet UIScrollView *view2;
@property (weak, nonatomic) IBOutlet UIScrollView *view3;
@property (retain, nonatomic) IBOutlet UITableView *view4;
@property (nonatomic, strong) NSMutableArray *carMakes;

@end
