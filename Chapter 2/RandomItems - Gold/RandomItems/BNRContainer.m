#import "BNRContainer.h"

@implementation BNRContainer

// Designated initializer
- (instancetype)initWithName:(NSString *)name
{
    _containerName = name;
    _subitems = [[NSMutableArray alloc] init];
    
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"N\\A"];
}

- (void)setContainerName: (NSString *)name
{
    _containerName = name;
}

- (NSString *)containerName
{
    return _containerName;
}

- (void)setSubitems: (id)item
{
    [_subitems addObject:item];
}

- (NSMutableArray *)subitems
{
    return _subitems;
}

- (NSString *)description
{
    int totalValue = 0;
    NSMutableString *itemList = [NSMutableString string];
    
    for (BNRItem *item in self.subitems) {
        totalValue += item.valueInDollars;
        [itemList appendFormat:@"%@\n", item.description];
    }
    
    return [[NSString alloc] initWithFormat:@"Name: %@\n Total value: $%d\n List:\n%@",
            self.containerName,
            totalValue,
            itemList];
}

@end
