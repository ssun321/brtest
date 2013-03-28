//
//  LoginViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 3. 8..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *textFieldID;
@property (retain, nonatomic) IBOutlet UITextField *textFieldPwd;
@property (copy, nonatomic) NSString* user_id;
@property (copy, nonatomic) NSString* user_pwd;

- (IBAction)clickLogin:(id)sender;
- (IBAction)clickManager:(id)sender;

@end
