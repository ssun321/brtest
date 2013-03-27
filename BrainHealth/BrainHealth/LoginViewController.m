//
//  LoginViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 3. 8..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "LoginViewController.h"

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
    [super viewDidUnload];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

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

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
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

@end
