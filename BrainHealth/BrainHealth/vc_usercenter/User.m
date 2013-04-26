//
//  User.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name;
@synthesize isMan;
@synthesize dateBirth;
@synthesize userID;
@synthesize userPwd;
@synthesize hint;

- (id)init{
    
    if(self = [super init]){
        self.name = @"";
        self.isMan = YES;
        self.dateBirth = [NSDate date];
        self.userID = @"";
        self.userPwd = @"";
        self.hint = 0;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.isMan = [aDecoder decodeBoolForKey:@"isMan"];
        self.dateBirth = [aDecoder decodeObjectForKey:@"dateBirth"];
        self.userID = [aDecoder decodeObjectForKey:@"userID"];
        self.userPwd = [aDecoder decodeObjectForKey:@"userPwd"];
        self.hint = [aDecoder decodeIntForKey:@"hint"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeBool:self.isMan forKey:@"isMan"];
    [aCoder encodeObject:self.dateBirth forKey:@"dateBirth"];
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.userPwd forKey:@"userPwd"];
    [aCoder encodeInt:self.hint forKey:@"hint"];
}

@end
