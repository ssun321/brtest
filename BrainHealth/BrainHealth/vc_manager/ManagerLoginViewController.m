//
//  ManagerLoginViewController.m
//  BrainHealth
//
//  Created by Tim on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ManagerLoginViewController.h"

@interface ManagerLoginViewController ()

@end

@implementation ManagerLoginViewController

@synthesize nextKey;

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
    
    if([self.nextKey isEqualToString:@"ManagerViewController"]){
        self.label.text = @"처방전 관리자 로그인";
    }else if([self.nextKey isEqualToString:@"UserCenterViewController"]){
        self.label.text = @"기기설정/사용자 설정 관리자 로그인";
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLogin:(id)sender {
    
    if([self.textField.text isEqualToString:MANAGER_PWD]){
        Class cls = NSClassFromString(self.nextKey);
        UIViewController* vc = [[cls alloc] initWithNibName:self.nextKey bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }else{
        [self alert:@"비밀번호가 틀렸습니다."];
    }
    
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_label release];
    [_textField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLabel:nil];
    [self setTextField:nil];
    [super viewDidUnload];
}

- (void)alert:(NSString*)msg{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self clickLogin:nil];
    return YES;
}

@end
