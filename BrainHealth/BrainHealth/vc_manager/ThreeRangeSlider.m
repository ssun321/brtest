//
//  BJRangeSliderWithProgress.m
//  BJRangeSliderWithProgress
//
//  Created by Barrett Jacobsen on 7/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ThreeRangeSlider.h"

BOOL titleInput = NO;

@implementation ThreeRangeSlider

@synthesize leftValue;
@synthesize rightValue;

@synthesize strLeft;
@synthesize strCenter;
@synthesize strRight;

- (void)setLeftValue:(CGFloat)newValue {
    if (newValue < 20)
        newValue = 20;
    
    if (newValue > rightValue - 20)
        newValue = rightValue - 20;
    
    leftValue = newValue;
    
    [self setNeedsLayout];
}

- (void)setRightValue:(CGFloat)newValue {
    if (newValue > 80)
        newValue = 80;
    
    if (newValue < leftValue + 20)
        newValue = leftValue + 20;
    
    rightValue = newValue;
    
    [self setNeedsLayout];
}

- (UIImage*)imageWithLevel:(NSString*)level{
    NSString* filename = [NSString stringWithFormat:@"admin_pres_level_%@bar_.png", [level lowercaseString]];
    return [[UIImage imageNamed:filename] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
}

- (void)setStrLeft:(NSString *)newString{
    strLeft = newString;
    imageViewLeft.image = [self imageWithLevel:newString];
    
    [self setNeedsLayout];
}

- (void)setStrCenter:(NSString *)newString{
    strCenter = newString;
    imageViewCenter.image = [self imageWithLevel:newString];
    
    [self setNeedsLayout];
}

- (void)setStrRight:(NSString *)newString{
    strRight = newString;
    imageViewRight.image = [self imageWithLevel:newString];
    
    [self setNeedsLayout];
}

- (void)setShowThumbs:(BOOL)showThumbs {
    leftThumb.hidden = !showThumbs;
    rightThumb.hidden = !showThumbs;
}

- (void)handleLeftPan:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:self];
        CGFloat range = 100;
        CGFloat availableWidth = self.frame.size.width;
        self.leftValue += translation.x / availableWidth * range;
        
        [gesture setTranslation:CGPointZero inView:self];
        
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)handleRightPan:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:self];
        CGFloat range = 100;
        CGFloat availableWidth = self.frame.size.width;
        self.rightValue += translation.x / availableWidth * range;
        
        [gesture setTranslation:CGPointZero inView:self];
        
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)setup {
    
    UIImage* image;
    
    leftValue = 60;
    rightValue = 80;
    
    image = [UIImage imageNamed:@"admin_pres_level_base_.png"];
    slider = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)]];
    [self addSubview:slider];

    //left
    image = [UIImage imageNamed:@"admin_pres_level_a1bar_.png"];
    imageViewLeft = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)]];
    [self addSubview:imageViewLeft];
    //middle
    
    image = [UIImage imageNamed:@"admin_pres_level_a2bar_.png"];
    imageViewCenter = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)]];
    [self addSubview:imageViewCenter];
    
    //right
    image = [UIImage imageNamed:@"admin_pres_level_a3bar_.png"];
    imageViewRight = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)]];
    [self addSubview:imageViewRight];

    // left thumb is above
    leftThumb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftThumb.image = [UIImage imageNamed:@"admin_pres_level_handle_.png"];
    leftThumb.userInteractionEnabled = YES;
    leftThumb.contentMode = UIViewContentModeCenter;
    [self addSubview:leftThumb];
    
    UIPanGestureRecognizer *leftPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftPan:)];
    [leftThumb addGestureRecognizer:leftPan];
    

    //right thumb is below
    rightThumb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightThumb.image = [UIImage imageNamed:@"admin_pres_level_handle_.png"];

    rightThumb.userInteractionEnabled = YES;
    rightThumb.contentMode = UIViewContentModeCenter;
    [self addSubview:rightThumb];
    
    UIPanGestureRecognizer *rightPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightPan:)];
    [rightThumb addGestureRecognizer:rightPan];
    
    labelLeft = [[UILabel alloc] initWithFrame:CGRectZero];
    labelLeft.backgroundColor = [UIColor clearColor];
    labelLeft.font = [UIFont systemFontOfSize:12];
    labelLeft.textColor = [UIColor whiteColor];
    labelLeft.textAlignment = UITextAlignmentCenter;
    [self addSubview:labelLeft];
    
    labelMiddle = [[UILabel alloc] initWithFrame:CGRectZero];
    labelMiddle.backgroundColor = [UIColor clearColor];
    labelMiddle.font = [UIFont systemFontOfSize:12];
    labelMiddle.textColor = [UIColor whiteColor];
    labelMiddle.textAlignment = UITextAlignmentCenter;
    [self addSubview:labelMiddle];
    
    labelRight = [[UILabel alloc] initWithFrame:CGRectZero];
    labelRight.backgroundColor = [UIColor clearColor];
    labelRight.font = [UIFont systemFontOfSize:12];
    labelRight.textColor = [UIColor whiteColor];
    labelRight.textAlignment = UITextAlignmentCenter;
    [self addSubview:labelRight];
    
    self.strLeft = @"A1";
    self.strCenter = @"A2";
    self.strRight = @"A3";

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        bTitle = NO;
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        bTitle = NO;
        self.clipsToBounds = YES;
        [self setup];
    }
    return self;
}

- (void)dealloc{
    
    [slider release];
    [imageViewLeft release];
    [imageViewCenter release];
    [imageViewRight release];
    
    [rightThumb release];
    [leftThumb release];
    
    [labelLeft release];
    [labelMiddle release];
    [labelRight release];
    
    [super dealloc];
}

- (void)layoutSubviews {
    self.backgroundColor = [UIColor clearColor];
    CGFloat availableWidth = self.frame.size.width;
    CGFloat inset = 0;
    
    CGFloat range = 100;
    
    CGFloat left = floorf(leftValue / range * availableWidth);
    CGFloat right = floorf(rightValue / range * availableWidth);
    
    if (isnan(left)) {
        left = 0;
    }
    
    if (isnan(right)) {
        right = 0;
    }
    
    slider.frame = CGRectMake(inset, self.frame.size.height, availableWidth, slider.image.size.height);

    //CGFloat rangeWidth = right - left;
    CGFloat rangeWidth = left;
        int h = imageViewLeft.image.size.height;
        int y = (self.frame.size.height - h) / 2;
        
    imageViewLeft.frame = CGRectMake(inset, y, rangeWidth, h);
    labelLeft.frame = imageViewLeft.frame;
    labelLeft.text = [NSString stringWithFormat:@"%@(%d%%)", strLeft, (int)leftValue];
    rangeWidth = right - left;
    imageViewCenter.frame = CGRectMake(inset + left, y, rangeWidth, h);
    labelMiddle.frame = imageViewCenter.frame;
    labelMiddle.text = [NSString stringWithFormat:@"%@(%d%%)", strCenter, (int)(rightValue - leftValue)];
    rangeWidth = availableWidth - right;
    imageViewRight.frame = CGRectMake(inset + right, y, rangeWidth, h);
    labelRight.frame = imageViewRight.frame;
    labelRight.text = [NSString stringWithFormat:@"%@(%d%%)", strRight, (int)(100 - rightValue)];
    
    leftThumb.center = CGPointMake(inset + left, self.frame.size.height / 2 );
    rightThumb.center = CGPointMake(inset + right, self.frame.size.height / 2 );
    
}



@end
