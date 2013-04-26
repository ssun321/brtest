//
//  StartViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIView *viewNoLogin;
@property (retain, nonatomic) IBOutlet UIView *viewLogin;

- (IBAction)clickLogin:(id)sender;
- (IBAction)clickAddUser:(id)sender;
- (IBAction)clickManager:(id)sender;

- (IBAction)clickTest:(id)sender;

@end
