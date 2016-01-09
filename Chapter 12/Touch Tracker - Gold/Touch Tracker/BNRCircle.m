#import "BNRCircle.h"

@implementation BNRCircle

- (CGFloat)radius
{
    CGFloat x1 = self.begin.x;
    CGFloat x2 = self.end.x;
    CGFloat y1 = self.begin.y;
    CGFloat y2 = self.end.y;

    return (sqrtf(powf((x2 - x1), 2) + powf((y2 - y1), 2))) / 2.0;
}

- (CGPoint)center
{
    CGFloat x1 = self.begin.x;
    CGFloat x2 = self.end.x;
    CGFloat y1 = self.begin.y;
    CGFloat y2 = self.end.y;
    
    CGPoint midPoint;
    midPoint.x = (x1 + x2) / 2.0;
    midPoint.y = (y1 + y2) / 2.0;
    
    return midPoint;
}

@end
