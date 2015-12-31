#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController ()

@property (nonatomic, copy) NSMutableArray *itemGreaterThanFiffy;
@property (nonatomic, copy) NSMutableArray *itemLessThanFiffy;

@end

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
        
        _itemGreaterThanFiffy = [[NSMutableArray alloc] init];
        _itemLessThanFiffy = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    // It will shows waring here because you didn't call the super class' designated initializer.
    return [self init];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"No more items!";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];

    NSArray *items = [[BNRItemStore sharedStore] allItem];
    
    for (BNRItem *item in items) {
        if (item.valueInDollars >= 50) {
            [self.itemGreaterThanFiffy addObject:item];
        }
        else {
            [self.itemLessThanFiffy addObject:item];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.itemGreaterThanFiffy.count;
    }
    else {
        return self.itemLessThanFiffy.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // There are two sections
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"$50 or more:";
    }
    else {
        return @"Less than $50";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    BNRItem *item;
    
    if (indexPath.section == 0) {
        item = [self.itemGreaterThanFiffy objectAtIndex:indexPath.row];
        cell.textLabel.text = [item description];
    }
    else {
        item = [self.itemLessThanFiffy objectAtIndex:indexPath.row];
        cell.textLabel.text = [item description];
    }
    
    
    
    
    
    return cell;
}

@end
