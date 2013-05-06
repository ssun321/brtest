//
//  ContentInfo.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 16..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentInfo.h"

@implementation ContentInfo

static ContentInfo* __contentInfoInstance = nil;

+ (ContentInfo*)shared {
	if( __contentInfoInstance == nil ){
		@synchronized(self){
            if(__contentInfoInstance == nil){
                __contentInfoInstance = [[self alloc] init];
            }
        }
	}
	return __contentInfoInstance;
}

- (id)init {
	if( ( self = [super init] ) )  {
		
		_contentMaster = [[NSMutableArray alloc] initWithCapacity:0];
		
		for (int i=0; i<sizeof(g_contentInfo)/sizeof(g_contentInfo[0]); i++) {
			NSDictionary *nDic = [NSDictionary dictionaryWithObjectsAndKeys:
								  g_contentInfo[i].seq,											@"seq",
								  g_contentInfo[i].subject,										@"subject",
								  [NSNumber numberWithInt:g_contentInfo[i].limitTime],			@"limitTime",
								  nil];
			[_contentMaster addObject:nDic];
		}
		
	}
	
	return self;
}

- (void)dealloc {
	
	[_contentMaster release];
	[super dealloc];
}

- (NSString *)subjectWithSeq:(NSString *)contentSeq{
	
	for (int i=0; i<_contentMaster.count; i++) {
		
		NSDictionary *nDic = [_contentMaster objectAtIndex:i];
		NSString *masterSeq = [nDic objectForKey:@"seq"];
		
		if ([contentSeq isEqualToString:masterSeq]) {
			return [nDic objectForKey:@"subject"];
		}
	}
	
	return nil;
};

- (int)limitTimeWithSeq:(NSString *)contentSeq{
	
	int value = 0;
	
	for (int i=0; i<_contentMaster.count; i++) {
		
		NSDictionary *nDic = [_contentMaster objectAtIndex:i];
		NSString *masterSeq = [nDic objectForKey:@"seq"];
		
		if ([contentSeq isEqualToString:masterSeq]) {
			value = [[nDic objectForKey:@"limitTime"] intValue];
		}
	}
	
	return value;
};

- (int)currentIndex{
	return 5;
};
- (int)currentCount{
	return 50;
};

@end
