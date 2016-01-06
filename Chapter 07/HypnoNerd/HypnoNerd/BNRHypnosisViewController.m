#import "BNRHypnosisViewController.h"
#import "BNRHypnosisterView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

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
    BNRHypnosisterView *backgroundView = [[BNRHypnosisterView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.placeholder = @"Hypnotize me!";
    textField.returnKeyType = UIReturnKeyDone;
    textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    textField.autocorrectionType = NO;
    textField.enablesReturnKeyAutomatically = YES;
    // My little touch to the app. You're welcome. :]
    textField.clearButtonMode = YES;
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    [textField resignFirstResponder];
    
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    UILabel *messageLabel = [[UILabel alloc] init];
    
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.text = message;
    
    [messageLabel sizeToFit];
    
    int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
    int x = arc4random() % width;
    
    int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
    int y = arc4random() % height;
    
    CGRect frame = messageLabel.frame;
    frame.origin = CGPointMake(x, y);
    messageLabel.frame = frame;
    
    [self.view addSubview:messageLabel];
    
    UIInterpolatingMotionEffect *motionEffect;
    
    motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffect.minimumRelativeValue = @-25;
    motionEffect.maximumRelativeValue = @25;
    
    [messageLabel addMotionEffect:motionEffect];
    
    motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    motionEffect.minimumRelativeValue = @-25;
    motionEffect.maximumRelativeValue = @25;
    
    [messageLabel addMotionEffect:motionEffect];
}

@end
