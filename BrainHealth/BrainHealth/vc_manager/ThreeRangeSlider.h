//
//  BJRangeSliderWithProgress.h
//  BJRangeSliderWithProgress
//
//  Created by Barrett Jacobsen on 7/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BJRANGESLIDER_THUMB_SIZE 70.0

@interface ThreeRangeSlider : UIControl {

    UIImageView *slider;
    UIImageView *progressImage;
    UIImageView *imageViewLeft;
    UIImageView *imageViewCenter;
    UIImageView *imageViewRight;
    
    UIImageView *leftThumb;
    UIImageView *rightThumb;
    
    UILabel* labelLeft;
    UILabel* labelMiddle;
    UILabel* labelRight;
    
    
    BOOL bTitle;
    
}
@property (nonatomic, retain) NSString* strLeft;
@property (nonatomic, retain) NSString* strCenter;
@property (nonatomic, retain) NSString* strRight;

@property (nonatomic, assign) CGFloat leftValue;
@property (nonatomic, assign) CGFloat rightValue;

@end
