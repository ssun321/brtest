//
//  MenuViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 2. 27..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *buttonMenu0;
@property (retain, nonatomic) IBOutlet UIButton *buttonMenu1;
@property (retain, nonatomic) IBOutlet UIButton *buttonMenu2;
@property (retain, nonatomic) IBOutlet UIButton *buttonMenu3;

@property (retain, nonatomic) IBOutlet UIView *viewMenu0;
@property (retain, nonatomic) IBOutlet UIView *viewMenu1;
@property (retain, nonatomic) IBOutlet UIView *viewMenu2;
@property (retain, nonatomic) IBOutlet UIView *viewMenu3;

- (IBAction)clickMenu0:(id)sender;
- (IBAction)clickMenu1:(id)sender;
- (IBAction)clickMenu2:(id)sender;
- (IBAction)clickMenu3:(id)sender;

- (IBAction)clickMenu00:(id)sender;
- (IBAction)clickMenu01:(id)sender;
- (IBAction)clickMenu02:(id)sender;
- (IBAction)clickMenu0_close:(id)sender;

- (IBAction)clickMenu10:(id)sender;
- (IBAction)clickMenu11:(id)sender;
- (IBAction)clickMenu12:(id)sender;
- (IBAction)clickMenu1_close:(id)sender;

- (IBAction)clickMenu20:(id)sender;
- (IBAction)clickMenu21:(id)sender;
- (IBAction)clickMenu22:(id)sender;
- (IBAction)clickMenu23:(id)sender;
- (IBAction)clickMenu2_close:(id)sender;

- (IBAction)clickMenu30:(id)sender;
- (IBAction)clickMenu31:(id)sender;
- (IBAction)clickMenu32:(id)sender;
- (IBAction)clickMenu33:(id)sender;
- (IBAction)clickMenu3_close:(id)sender;

@end

