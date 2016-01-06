#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItem;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
