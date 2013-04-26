//
//  ManagerLoginViewController.h
//  BrainHealth
//
//  Created by Tim on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerLoginViewController : UIViewController

@property (nonatomic, copy) NSString* nextKey;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UITextField *textField;

- (IBAction)clickLogin:(id)sender;
- (IBAction)clickBack:(id)sender;

@end
