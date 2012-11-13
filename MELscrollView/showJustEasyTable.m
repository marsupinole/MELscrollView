#import "showJustEasyTable.h"

//still don't understand what this does
#define SHOW_MULTIPLE_SECTIONS 1

//the a in CGRectMake(a, b, c, d)
#define PORTRAIT_WIDTH 500

//the b in CGRectMake(a, b, c, d)
#define PORTRAIT_HEIGHT 50

//don't understand this
#define LANDSCAPE_HEIGHT (1024-20)

//the overall height of the table
#define HORIZONTAL_TABLEVIEW_HEIGHT 40

//the overall width of the table
#define VERTICAL_TABLEVIEW_WIDTH 300

#define TABLE_BACKGROUND_COLOR [UIColor clearColor]

//don't know
#define BORDER_VIEW_TAG 10

#ifdef SHOW_MULTIPLE_SECTIONS
//the total number of cells
#define NUM_OF_CELLS 30
#define NUM_OF_SECTIONS 4
#else
#define NUM_OF_CELLS 21
#endif


@interface showJustEasyTable ()

@end

@implementation showJustEasyTable
@synthesize verticalView2;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupVerticalView2];
}

- (void)setupVerticalView2
{
    CGRect frameRect = CGRectMake(PORTRAIT_WIDTH - VERTICAL_TABLEVIEW_WIDTH, PORTRAIT_HEIGHT, VERTICAL_TABLEVIEW_WIDTH, LANDSCAPE_HEIGHT);
    EasyTableView *view	= [[EasyTableView alloc] initWithFrame:frameRect numberOfRows:NUM_OF_CELLS ofHeight:HORIZONTAL_TABLEVIEW_HEIGHT];
    self.verticalView2 = view;
    
    verticalView2.delegate = self;
    verticalView2.tableView.backgroundColor = TABLE_BACKGROUND_COLOR;
    verticalView2.tableView.allowsSelection = YES;
    verticalView2.tableView.separatorColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    verticalView2.cellBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    verticalView2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Allow verticalView to scroll up and completely clear the horizontalView
    verticalView2.tableView.contentInset = UIEdgeInsetsMake(0, 0, HORIZONTAL_TABLEVIEW_HEIGHT, 0);
    
    //view3.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:verticalView2];
}

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
