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

@synthesize user;
@synthesize dicSearch;

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
    
    user = [[User alloc] init];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"pwd_search" ofType:@"plist"];
    dicSearch = [[NSDictionary alloc] initWithContentsOfFile:path];
                 
    self.viewBackground.hidden = YES;
    [self.view addSubview:self.viewBackground];
    
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
    NSString* clsName = @"ManagerViewController";
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)clickMan:(id)sender {
    self.buttonMan.selected = YES;
    self.buttonWoman.selected = NO;
}

- (IBAction)clickWoman:(id)sender {
    self.buttonMan.selected = NO;
    self.buttonWoman.selected = YES;
}

- (IBAction)clickAge:(id)sender {
    self.viewDate.hidden = NO;
    self.viewSearch.hidden = YES;
    self.viewBackground.hidden = NO;
}

- (IBAction)clickSearchID:(id)sender {
    self.viewDate.hidden = YES;
    self.viewSearch.hidden = NO;
    self.viewBackground.hidden = NO;
}

- (void)dealloc {
    
    [user release];
    [dicSearch release];
    
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
    self.viewBackground.hidden = YES;
}

- (IBAction)clickDateOK:(id)sender {
    [self clickBackground:nil];
}

- (IBAction)clickSearchOK:(id)sender {
    [self clickBackground:nil];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component == 0){
        NSArray* array = [self.dicSearch objectForKey:@"title"];
        return array.count;
    }else{
        int index = [pickerView selectedRowInComponent:0];
        NSArray* arrayItem = [self.dicSearch objectForKey:[NSString stringWithFormat:@"item%d", index]];
        return arrayItem.count;
    }
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if(component == 0){
        return 180;
    }else{
        return 100;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        NSArray* array = [self.dicSearch objectForKey:@"title"];
        return [array objectAtIndex:row];
    }else{
        int index = [pickerView selectedRowInComponent:0];
        NSArray* arrayItem = [self.dicSearch objectForKey:[NSString stringWithFormat:@"item%d", index]];
        return [arrayItem objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:1];
    }
}

@end
