//
//  showJustEasyTable.h
//  MELscrollView
//
//  Created by Mike Leveton on 11/12/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyTableView.h"

@interface showJustEasyTable : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *view4;
@property (nonatomic) EasyTableView *verticalView2;
@property (nonatomic) EasyTableView *verticalView3;
@property (nonatomic, strong) NSMutableArray *carMakes2;

@end
