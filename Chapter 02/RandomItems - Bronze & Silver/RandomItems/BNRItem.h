#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype)initWithName: (NSString *)name
              valueInDollars: (int)value
                seiralNumber: (NSString *)sNumber;

// Silver challenge
- (instancetype)initWithName: (NSString *)name
                seiralNumber: (NSString *)sNumber;

- (instancetype)initWithName: (NSString *)name;

- (void)setItemName: (NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber: (NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars: (int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

@end
