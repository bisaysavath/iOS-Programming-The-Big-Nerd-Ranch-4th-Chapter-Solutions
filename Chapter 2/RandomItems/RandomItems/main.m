#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
//            [items addObject:[BNRItem randomItem]];
            items[i] = [BNRItem randomItem];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        items = nil;
    }
    
    return 0;
}