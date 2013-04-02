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
- (IBAction)clickLogin:(id)sender;
- (IBAction)clickAddUser:(id)sender;
- (IBAction)clickManager:(id)sender;


@end
