#import "BNRHypnosisterView.h"

@implementation BNRHypnosisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width) / 2.0;
    center.y = (bounds.origin.y + bounds.size.height) / 2.0;
    
//    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
//    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    path.lineWidth = 10.0;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    // Get current context and save it to a variable
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // Gold Challenge - Gradient
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[ 8] = { 0.0, 1.0, 0.0, 1.0, // Start color is green
        1.0, 1.0, 0.0, 1.0 }; // End color is yellow
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(bounds.size.width / 2.0, 0.0);
    CGPoint endPoint = CGPointMake(bounds.size.width / 2.0, bounds.size.height);
    
    
    // Save a state
    CGContextSaveGState(currentContext);
    
    // Alternatively, I could have delcared a variable holding a logo image before this code
    // and use that image bound to determine the size of the traingle
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    CGPoint topOfTriangle = CGPointMake(center.x, center.y - 150);
    CGPoint bottomRightOfTriangle = CGPointMake(center.x + 100, center.y + 200);
    CGPoint bottomLeftOfTriangle = CGPointMake(center.x - 100, center.y + 200);
    
    // Put a tip of a pencil at the top of a triangle
    [trianglePath moveToPoint:topOfTriangle];
    [trianglePath addLineToPoint:bottomRightOfTriangle];
    [trianglePath addLineToPoint:bottomLeftOfTriangle];
    [trianglePath addLineToPoint:topOfTriangle];
    
    [trianglePath addClip];
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    // Restore a state
    CGContextRestoreGState(currentContext);
    
    // Gold Challenge - Shadow
    // Save state before a shadow exists
    CGContextSaveGState(currentContext);
    // Set shadow
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    // Bronze challenge
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect imageFrame = CGRectMake(center.x - (200 / 2.0),
                                   center.y - (300 / 2.0),
                                   200, 300);
    
    [logoImage drawInRect:imageFrame];
    
    // Go back to a state where shadow didn't exist
    CGContextRestoreGState(currentContext);
}

@end
