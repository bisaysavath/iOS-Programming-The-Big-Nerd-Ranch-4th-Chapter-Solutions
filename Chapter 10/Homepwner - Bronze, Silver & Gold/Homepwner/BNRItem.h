#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

//@property (nonatomic, strong) BNRItem *containedItem;
//@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSDate *dateCreated;

+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype)initWithName: (NSString *)name
              valueInDollars: (int)value
                seiralNumber: (NSString *)sNumber;

- (instancetype)initWithName: (NSString *)name;

@end
