//
//  UserCell.m
//  BrainHealth
//
//  Created by Tim on 13. 4. 17..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "UserCell.h"
#import "User.h"

@implementation UserCell

@synthesize imageViewBG;
@synthesize user=_user;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imageViewBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"admin_user_box_bar1_.png"]];
        [self insertSubview:imageViewBG atIndex:0];
        [imageViewBG release];
        
    }
    return self;
}

- (void)setUser:(User *)theUser{
    _user = theUser;
    
    self.textLabel.text = _user.name;
    self.detailTextLabel.text = [_user.dateStart description];
    
    [self setNeedsLayout];
}

- (void)settingBackgroundWithIndex:(int)index last:(BOOL)isLast{
    
    UIImage* image = !isLast ? [UIImage imageNamed:@"admin_user_box_bar1_.png"] : [UIImage imageNamed:@"admin_user_box_bar3_.png"];
    imageViewBG.image = image;
    imageViewBG.highlighted = (index % 2 == 0);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    
}

#pragma mark - UIView layout

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10, 10, 50, 50);
    self.textLabel.frame = CGRectMake(70, 10, 240, 20);

}

@end
