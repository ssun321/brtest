//
//  ContentUtil.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 22..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <Foundation/Foundation.h>


#define degreesToRadians(x) (M_PI*x/180.0)  // 회전 각 구하기

@interface ContentUtil : NSObject

+ (ContentUtil*)shared;

- (int)imageTotalCountWithType:(NSString*)type;
- (void)answerExampleResult:(BOOL)result WithSuperView:(UIView*)pView;
- (NSMutableArray*)randomArrayWithMinValue:(unsigned int)minVal MaxValue:(unsigned int)maxVal count:(unsigned int)count;

@end
