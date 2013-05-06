//
//  ItemManager.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 29..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemManager : NSObject

@property (nonatomic, retain) NSDictionary* dicRoot;

+ (ItemManager*)shared;

- (NSString*)nameWithIndex:(NSString*)index;
- (NSArray*)arrayWithIndex:(NSString*)index;

@end
