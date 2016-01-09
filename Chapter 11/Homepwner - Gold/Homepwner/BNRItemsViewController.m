#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRItemsViewController ()

//@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

#pragma mark - Controller life cycle
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
//        UINavigationItem *navItem = self.navigationItem;
//        navItem.title = @"Homepwner";
        self.navigationItem.title = @"Homepwner";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        self.navigationItem.rightBarButtonItem = bbi;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    // It will shows waring here because you didn't call the super class' designated initializer.
    return [self init];
}

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItem] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *items = [[BNRItemStore sharedStore] allItem];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

//- (UIView *)headerView
//{
//    if (!_headerView) {
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    
//    return _headerView;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[BNRItemStore sharedStore] allItem];
        BNRItem *item = items[indexPath.row];
        
        [[BNRItemStore sharedStore] removeItem:item];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    NSArray *items = [[BNRItemStore sharedStore] allItem];
    BNRItem *selectedItem = items[indexPath.row];
    detailViewController.item = selectedItem;
}

#pragma mark - Actions
- (IBAction)addNewItem:(id)sender
{
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItem] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

//- (IBAction)toggleEdittingMode:(id)sender
//{
//    if (self.isEditing) {
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        [self setEditing:NO animated:YES];
//    }
//    else {
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        [self setEditing:YES animated:YES];
//    }
//}

@end
