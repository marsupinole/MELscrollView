//
//  MELscrollViewViewController.h
//  MELscrollView
//
//  Created by Azam Malik on 11/10/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyTableView.h"
#import "showJustEasyTable.h"

@interface MELscrollViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIScrollView *view1;
@property (weak, nonatomic) IBOutlet UIScrollView *view2;
@property (weak, nonatomic) IBOutlet UIScrollView *view3;
@property (retain, nonatomic) IBOutlet UITableView *view4;
@property (nonatomic, strong) NSMutableArray *carMakes;
@property (nonatomic) EasyTableView *verticalView;
@property (retain, nonatomic) showJustEasyTable *justShowTheFuckingTable;
@property (weak, nonatomic) IBOutlet UIButton *showJustEasyTable;

- (IBAction)showJustEasyTable:(id)sender;
@end
