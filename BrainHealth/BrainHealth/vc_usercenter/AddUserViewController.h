//
//  AddUserViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "User.h"

@interface AddUserViewController : UIViewController

@property (retain, nonatomic) User* user;
@property (retain, nonatomic) NSDictionary* dicSearch;

@property (retain, nonatomic) IBOutlet UITextField *textFieldName;
@property (retain, nonatomic) IBOutlet UIButton *buttonMan;
@property (retain, nonatomic) IBOutlet UIButton *buttonWoman;
@property (retain, nonatomic) IBOutlet UIButton *buttonAge;
@property (retain, nonatomic) IBOutlet UITextField *textFieldAge;
@property (retain, nonatomic) IBOutlet UITextField *textFieldPwd;
@property (retain, nonatomic) IBOutlet UITextField *textFieldPwd2;

- (IBAction)clickBack:(id)sender;
- (IBAction)clickManager:(id)sender;
- (IBAction)clickMan:(id)sender;
- (IBAction)clickWoman:(id)sender;
- (IBAction)clickAge:(id)sender;
- (IBAction)clickSearchID:(id)sender;

@property (retain, nonatomic) IBOutlet UIControl *viewBackground;
- (IBAction)clickBackground:(id)sender;

@property (retain, nonatomic) IBOutlet UIView *viewDate;
@property (retain, nonatomic) IBOutlet UILabel *labelDateTitle;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)clickDateOK:(id)sender;



@property (retain, nonatomic) IBOutlet UIView *viewSearch;
@property (retain, nonatomic) IBOutlet UILabel *labelSearchTitle;
@property (retain, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)clickSearchOK:(id)sender;

@end
