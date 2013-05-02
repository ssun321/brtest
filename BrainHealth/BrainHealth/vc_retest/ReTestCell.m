//
//  ReTestCell.m
//  BrainHealth
//
//  Created by timzero on 13. 5. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ReTestCell.h"

@implementation ReTestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_imageViewBG release];
    [_labelNum release];
    [_labelTitle release];
    [_labelDate release];
    [_button release];
    [super dealloc];
}
@end
