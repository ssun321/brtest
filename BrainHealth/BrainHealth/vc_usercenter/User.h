//
//  User.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) BOOL isMan;
@property (nonatomic, copy) NSDate* dateBirth;
@property (nonatomic, copy) NSString* userID;
@property (nonatomic, copy) NSString* userPwd;
@property (nonatomic, assign) int hint;

@end
