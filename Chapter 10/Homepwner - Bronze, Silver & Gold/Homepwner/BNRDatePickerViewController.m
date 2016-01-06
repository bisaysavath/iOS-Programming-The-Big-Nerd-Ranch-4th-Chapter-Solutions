//
//  BNRDatePickerViewController.m
//  Homepwner
//
//  Created by Billy Saysavath on 1/5/16.
//  Copyright © 2016 Billy Saysavath. All rights reserved.
//

#import "BNRDatePickerViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDatePickerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.navigationItem.title = @"Date Picker";
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.maximumDate = [NSDate date];
}

- (IBAction)setDate:(UIButton *)sender {
    self.item.dateCreated = self.datePicker.date;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
