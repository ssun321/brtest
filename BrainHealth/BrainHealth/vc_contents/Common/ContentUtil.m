//
//  ContentUtil.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 22..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentUtil.h"

@implementation ContentUtil

static ContentUtil* __contentUtilInstance = nil;

+ (ContentUtil*)shared {
	if( __contentUtilInstance == nil ){
		@synchronized(self){
            if(__contentUtilInstance == nil){
                __contentUtilInstance = [[self alloc] init];
            }
        }
	}
	return __contentUtilInstance;
}

- (id)init {
	if( ( self = [super init] ) )  {
		
		
	}
	
	return self;
}

- (void)dealloc {
	
	[super dealloc];
}

#pragma mark - 불라불라
- (int)imageTotalCountWithType:(NSString*)type {
    int totalCount = 0;
    if ( [@"026" isEqualToString:type] ) {
        totalCount = 11;
    } else {
        totalCount = 10;
    }
    return totalCount;
}

- (NSMutableArray*)randomArrayWithMinValue:(unsigned int)minVal MaxValue:(unsigned int)maxVal count:(unsigned int)count {

    if ( minVal == 0 )  maxVal += 1;

    NSMutableArray* arStdValue = [NSMutableArray array];
    for ( int i = minVal; i < maxVal; i++ ) {
        [arStdValue addObject:[NSNumber numberWithInt:i]];
    }

    NSMutableArray* arResult = [NSMutableArray array];

    while ( count != [arResult count] ) {
        int randNum = arc4random()%maxVal+minVal;
        
        if ( [arResult containsObject:[NSNumber numberWithInt:randNum]] ) {
            continue;
        }
        [arResult addObject:[arStdValue objectAtIndex:randNum]];
    }
    
    return arResult;
}

- (void)answerExampleResult:(BOOL)result WithSuperView:(UIView*)pView {
    UIImage* image;
    UIImageView* resultImg = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, pView.bounds.size.width, pView.bounds.size.height)];
    // 정답
    if (result) {
        image = [UIImage imageNamed:@"tp_s_0_.png"];
    }
    // 오답
    else {
        image =  [UIImage imageNamed:@"tp_s_X_.png"];
    }
    [resultImg setImage:image];
    [pView addSubview:resultImg];
    [resultImg release];
}

@end
