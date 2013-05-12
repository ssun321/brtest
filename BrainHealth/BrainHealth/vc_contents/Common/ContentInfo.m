//
//  ContentInfo.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 16..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentInfo.h"

@implementation ContentInfo

@synthesize setting_narration	= _setting_narration;
@synthesize setting_caption		= _setting_caption;
@synthesize setting_sound		= _setting_sound;
@synthesize setting_timer		= _setting_timer;

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
		
		//master
		_contentMaster = [[NSMutableArray alloc] initWithCapacity:0];
		
		for (int i=0; i<sizeof(g_contentInfo)/sizeof(g_contentInfo[0]); i++) {
			NSDictionary *nDic = [NSDictionary dictionaryWithObjectsAndKeys:
								  g_contentInfo[i].seq,											@"seq",
								  g_contentInfo[i].subject,										@"subject",
								  [NSNumber numberWithInt:g_contentInfo[i].limitTime],			@"limitTime",
								  nil];
			[_contentMaster addObject:nDic];
		}
		
		NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
		if ([userDefaults objectForKey:USER_KEY_CHECK_INSTALL_APP] == nil) {
			//앱 최초실행시
			[userDefaults setBool:YES forKey:USER_KEY_CONTENT_NARRATION];
			[userDefaults setBool:YES forKey:USER_KEY_CONTENT_CAPTION];
			[userDefaults setBool:YES forKey:USER_KEY_CONTENT_SOUND];
			[userDefaults setBool:YES forKey:USER_KEY_CONTENT_TIMER];
			
			//앱 최초실행 후 기록 남기기
			[userDefaults setObject:@"SAVED" forKey:USER_KEY_CHECK_INSTALL_APP];
		}
	
	_setting_narration	= [userDefaults boolForKey:USER_KEY_CONTENT_NARRATION];
	_setting_caption	= [userDefaults boolForKey:USER_KEY_CONTENT_CAPTION];
	_setting_sound		= [userDefaults boolForKey:USER_KEY_CONTENT_SOUND];
	_setting_timer		= [userDefaults boolForKey:USER_KEY_CONTENT_TIMER];
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

- (void)setSetting_narration:(BOOL)setting_narration{
	_setting_narration = setting_narration;
	[[NSUserDefaults standardUserDefaults] setBool:_setting_narration forKey:USER_KEY_CONTENT_NARRATION];
}

- (void)setSetting_caption:(BOOL)setting_caption{
	_setting_caption = setting_caption;
	[[NSUserDefaults standardUserDefaults] setBool:_setting_caption forKey:USER_KEY_CONTENT_CAPTION];
}

- (void)setSetting_sound:(BOOL)setting_sound{
	_setting_sound = setting_sound;
	[[NSUserDefaults standardUserDefaults] setBool:_setting_sound forKey:USER_KEY_CONTENT_SOUND];
}

- (void)setSetting_timer:(BOOL)setting_timer{
	_setting_timer = setting_timer;
	[[NSUserDefaults standardUserDefaults] setBool:_setting_timer forKey:USER_KEY_CONTENT_TIMER];
}

@end
