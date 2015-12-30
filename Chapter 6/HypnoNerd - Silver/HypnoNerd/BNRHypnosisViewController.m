#import "BNRHypnosisViewController.h"
#import "BNRHypnosisterView.h"

@interface BNRHypnosisViewController ()

// Notice I moved a property of circleColor in BNRHypnosisterView.m to BNRHypnosisterView.h
// so that I can access its setter method from here
@property (nonatomic, strong) BNRHypnosisterView *backgroundView;
@property (nonatomic, strong) UISegmentedControl *segmentControl;

@end

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypno";
        
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    _backgroundView = [[BNRHypnosisterView alloc] initWithFrame:frame];
    
    NSArray *controlItems = @[@"Red", @"Green", @"Blue"];
    _segmentControl = [[UISegmentedControl alloc] initWithItems:controlItems];
    
    _segmentControl.frame = CGRectMake(10, 50, 300, 25);
    
    [_segmentControl addTarget:self
                       action:@selector(changeCircleColor)
               forControlEvents:UIControlEventValueChanged];
    
    self.view = _backgroundView;
    [self.view addSubview:_segmentControl];
}

- (void)changeCircleColor
{
    UIColor *selectedColor;
    
    if (self.segmentControl.selectedSegmentIndex == 0) {
        selectedColor = [UIColor redColor];
    }
    else if (self.segmentControl.selectedSegmentIndex == 1) {
        selectedColor = [UIColor greenColor];
    }
    else {
        selectedColor = [UIColor blueColor];
    }
    
    self.backgroundView.circleColor = selectedColor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

@end
