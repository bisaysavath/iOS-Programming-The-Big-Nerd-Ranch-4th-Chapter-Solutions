#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRDatePickerViewController.h"

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;

@end

@implementation BNRDetailViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(fieldsResignFirstResponder)];
        self.navigationItem.rightBarButtonItem = bbi;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter;
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateField.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void)fieldsResignFirstResponder
{
    if ([self.nameField isFirstResponder]) {
        [self.nameField resignFirstResponder];
    }
    else if ([self.serialNumberField isFirstResponder]) {
        [self.serialNumberField resignFirstResponder];
    }
    else if ([self.valueField isFirstResponder]) {
        [self.valueField resignFirstResponder];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)changeDate:(UIButton *)sender {
    BNRDatePickerViewController *datePickerViewController = [[BNRDatePickerViewController alloc] init];
    datePickerViewController.item = self.item;
    [self.navigationController pushViewController:datePickerViewController animated:YES];
}

@end
