//
//  ReTestViewController.h
//  BrainHealth
//
//  Created by Tim on 13. 5. 1..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReTestViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageViewBG;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)clickBack:(id)sender;

@end
