#import <Foundation/Foundation.h>
//#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        BNRContainer *container = [[BNRContainer alloc] initWithName:@"Big Box"];
        
        
        for (int i = 0; i < 10; i++) {
             container.subitems = [BNRItem randomItem];
        }
        
        NSLog(@"%@", container);
        
        container = nil;
    }
    
    return 0;
}