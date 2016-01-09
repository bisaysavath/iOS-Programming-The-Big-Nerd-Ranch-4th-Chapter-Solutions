#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

#pragma mark - View life cycle
- (void)loadView
{
    [super loadView];
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    
}

@end
