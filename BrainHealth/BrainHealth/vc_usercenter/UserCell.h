//
//  UserCell.h
//  BrainHealth
//
//  Created by Tim on 13. 4. 17..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface UserCell : UITableViewCell

@property (nonatomic, retain) UIImageView* imageViewBG;

@property (nonatomic, assign) User* user;


- (void)settingBackgroundWithIndex:(int)index last:(BOOL)isLast;

@end
