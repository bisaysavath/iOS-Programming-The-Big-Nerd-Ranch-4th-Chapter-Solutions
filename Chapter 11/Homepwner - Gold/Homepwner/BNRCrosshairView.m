#import "BNRCrosshairView.h"

@implementation BNRCrosshairView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    path.lineWidth = 1.0;
    
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width) / 2.0;
    center.y = (bounds.origin.y + bounds.size.height) / 2.0;
    
    CGPoint startingPointTopOfCenter = center;
    startingPointTopOfCenter.x += 20.0;
    
    CGPoint startingPointBottomOfCenter = center;
    startingPointBottomOfCenter.x -= 20.0;
    
    CGPoint startingPointLeftOfCenter = center;
    startingPointLeftOfCenter.y -= 20.0;
    
    CGPoint startingPointRightOfCenter = center;
    startingPointRightOfCenter.y += 20.0;
    
    [path moveToPoint:startingPointTopOfCenter];
    [path addLineToPoint:startingPointBottomOfCenter];
    
    [path moveToPoint:startingPointLeftOfCenter];
    [path addLineToPoint:startingPointRightOfCenter];
    
    [[UIColor blackColor] setStroke];
    [path stroke];
}


@end
