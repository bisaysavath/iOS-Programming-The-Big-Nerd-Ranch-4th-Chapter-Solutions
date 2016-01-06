#import "BNRItem.h"

@implementation BNRItem

- (instancetype)initWithName: (NSString *)name
              valueInDollars: (int)value
                seiralNumber: (NSString *)sNumber
{
    self = [super init];
    
    if (self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % randomAdjectiveList.count;
    NSInteger nounIndex = arc4random() % randomNounList.count;
    
    NSString *randomName = [[NSString alloc] initWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [[NSString alloc] initWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    return [[self alloc] initWithName:randomName valueInDollars:randomValue seiralNumber:randomSerialNumber];
}

- (instancetype)initWithName: (NSString *)name
{
    return [self initWithName:name
               valueInDollars:0
                 seiralNumber:@""];
}

- (instancetype)init
{
    return [self initWithName:@"Item"];
}

//- (void)setContainedItem: (BNRItem *)containedItem
//{
//    _containedItem = containedItem;
//    
//    self.containedItem.container = self;
//}

- (NSString *)description
{
    return [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
            self.itemName,
            self.serialNumber,
            self.valueInDollars,
            self.dateCreated];
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
