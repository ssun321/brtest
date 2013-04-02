//
//  AddUserViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "AddUserViewController.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

#pragma mark - Button Action

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickManager:(id)sender {
}

- (IBAction)clickMan:(id)sender {
}

- (IBAction)clickWoman:(id)sender {
}

- (IBAction)clickAge:(id)sender {
}

- (IBAction)clickSearchID:(id)sender {
}

- (void)dealloc {
    [_textFieldName release];
    [_buttonMan release];
    [_buttonWoman release];
    [_buttonAge release];
    [_textFieldAge release];
    [_textFieldPwd release];
    [_textFieldPwd2 release];
    [_viewDate release];
    [_viewSearch release];
    [_labelDateTitle release];
    [_datePicker release];
    [_labelSearchTitle release];
    [_pickerView release];
    [_viewBackground release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextFieldName:nil];
    [self setButtonMan:nil];
    [self setButtonWoman:nil];
    [self setButtonAge:nil];
    [self setTextFieldAge:nil];
    [self setTextFieldPwd:nil];
    [self setTextFieldPwd2:nil];
    [self setViewDate:nil];
    [self setViewSearch:nil];
    [self setLabelDateTitle:nil];
    [self setDatePicker:nil];
    [self setLabelSearchTitle:nil];
    [self setPickerView:nil];
    [self setViewBackground:nil];
    [super viewDidUnload];
}



- (IBAction)clickBackground:(id)sender {
}

- (IBAction)clickDateOK:(id)sender {
}

- (IBAction)clickSearchOK:(id)sender {
}

@end
