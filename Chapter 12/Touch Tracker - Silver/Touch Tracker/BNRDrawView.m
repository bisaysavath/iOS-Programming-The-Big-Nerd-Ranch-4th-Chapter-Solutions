#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()

//@property (nonatomic, strong) BNRLine *currentLine;

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

#pragma mark - View life cycle
- (instancetype)initWithFrame:(CGRect)r
{
    self = [super initWithFrame:r];
    
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

#pragma mark - Drawing actions
- (void)strokeLine:(BNRLine *)line
{
    UIBezierPath *bp = [[UIBezierPath alloc] init];
    bp.lineWidth = 10.0;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect
{
    for (BNRLine *line in self.finishedLines) {
        // Set the color everytime each line needs to be drawn
        [line.color set];
        [self strokeLine:line];
    }

    [[UIColor redColor] set];
    for (BNRLine *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
    
//    if (self.currentLine) {
//        [[UIColor redColor] set];
//        [self strokeLine:self.currentLine];
//    }
}

#pragma mark - Touch events
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine = [[BNRLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        BNRLine *line = self.linesInProgress[key];
        line.end = location;
    }
    
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        BNRLine *line = self.linesInProgress[key];
        
        
        // Gold Challenge
        // Figure out the angle (Using Trigonometry)
        float x = fabsf(line.end.x - line.begin.x);
        float y = fabsf(line.end.y - line.begin.y);
        
        float angle = fabsf(tanf(y / x));
        
        line.color = [UIColor colorWithHue:angle saturation:1.0 brightness:1.0 alpha:1.0];
        
        [self.finishedLines addObject:line];
        
        [self.linesInProgress removeObjectForKey:key];
    }
//    [self.finishedLines addObject:self.currentLine];
//    
//    self.currentLine = nil;
//    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

@end
