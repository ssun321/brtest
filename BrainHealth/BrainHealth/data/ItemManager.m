//
//  ItemManager.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 29..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ItemManager.h"

@implementation ItemManager

static ItemManager* __manager;

+ (ItemManager*)shared{
    if(__manager == nil){
        __manager = [[ItemManager alloc] init];
    }
    
    return __manager;
}

- (id)init{
    
    self = [super init];
    if(self){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"item" ofType:@"plist"];
        _dicRoot = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return self;
}

// index : 1 ~ 8
- (NSString*)nameWithIndex:(NSString*)index{
    NSDictionary* dic = [_dicRoot objectForKey:index];
    return [dic objectForKey:@"NAME"];
}

- (NSArray*)arrayWithIndex:(NSString*)index{
    NSDictionary* dic = [_dicRoot objectForKey:index];
    return [dic objectForKey:@"ITEMS"];
}



@end
