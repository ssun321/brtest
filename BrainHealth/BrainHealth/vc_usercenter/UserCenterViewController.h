//
//  UserCenterViewController.h
//  BrainHealth
//
//  Created by Tim on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCenterViewController : UIViewController

@property (nonatomic, retain) NSMutableArray* arrayUser;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)clickBack:(id)sender;

@end
