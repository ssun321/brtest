//
//  GraphView.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIImageView* imageView;
@property (nonatomic, retain) UIButton* button;

@end
