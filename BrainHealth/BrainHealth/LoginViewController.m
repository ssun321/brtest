//
//  LoginViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 3. 8..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "LoginViewController.h"

#import "MenuViewController.h"
#import "ManagerViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]];
    
    self.user_id = @"jay";
    self.user_pwd = @"1111";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textFieldID release];
    [_textFieldPwd release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextFieldID:nil];
    [self setTextFieldPwd:nil];
    [self setUser_id:nil];
    [self setUser_pwd:nil];
    [super viewDidUnload];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == _textFieldPwd){
        [UIView beginAnimations:@"KEYBOARD_UP" context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        
        CGRect frame = self.view.frame;
        frame.origin.y = -50;
        self.view.frame = frame;
        
        [UIView commitAnimations];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == _textFieldPwd){
        [UIView beginAnimations:@"KEYBOARD_UP" context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
        
        [UIView commitAnimations];
    }
}

- (void)alert:(NSString*)msg{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

- (BOOL)checkLogin:(NSString*)inputID pwd:(NSString*)pwd{
    
    if([inputID isEqualToString:self.user_id] && [pwd isEqualToString:self.user_pwd]){
        return YES;
    }
    
    return NO;
}

#pragma mark - Button Action

- (IBAction)clickLogin:(id)sender {
    
    // 아이디가 입력되어 있는지 확인
    if(_textFieldID.text.length == 0){
        [self alert:@"아이디를 입력해 주세요."];
        return;
    }
    
    // 암호가 입력되어 있는지 확인
    if(_textFieldPwd.text.length == 0){
        [self alert:@"아이디를 입력해 주세요."];
        return;
    }
    
    // 아이디 비밀번호가 맞게 입력되어 있는지 확인
    if(![self checkLogin:_textFieldID.text pwd:_textFieldPwd.text]){
        [self alert:@"아이디와 암호가 맞지 않습니다. 다시 입력해 주세요."];
        return;
    }
    
    // 메뉴 화면으로 이동
    MenuViewController* vc = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)clickManager:(id)sender {
    
}

@end
