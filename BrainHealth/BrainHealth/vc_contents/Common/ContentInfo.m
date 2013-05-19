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

- (void)loadContentMaster{
	//master
	_contentMaster = [[NSMutableArray alloc] initWithCapacity:0];
	
	for (int i=0; i<sizeof(g_contentInfo)/sizeof(g_contentInfo[0]); i++) {
		NSDictionary *nDic = [NSDictionary dictionaryWithObjectsAndKeys:
							  g_contentInfo[i].seq,											@"seq",
							  g_contentInfo[i].subject,										@"subject",
							  [NSNumber numberWithInt:g_contentInfo[i].limitTime],			@"limitTime",
							  [NSNumber numberWithInt:g_contentInfo[i].diversionCnt],		@"diversionCnt",
							  nil];
		[_contentMaster addObject:nDic];
	}
}

- (void)loadSettingValues{
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

- (void)loadCaptionMaster{
	
	_captionMaster = [[NSMutableDictionary alloc] initWithCapacity:0];
	[_captionMaster setObject:@"아래에 보이는 선들 중 왼손을 모두 찾아 주세요." forKey:@"0161A"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 왼손을 모두 찾아 주세요." forKey:@"0162A"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 왼손을 모두 찾아 주세요." forKey:@"0163A"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 왼손을 모두 찾아 주세요." forKey:@"0164A"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 왼손을 모두 찾아 주세요." forKey:@"0165A"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 오른손을 모두 찾아 주세요." forKey:@"0161B"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 오른손을 모두 찾아 주세요." forKey:@"0162B"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 오른손을 모두 찾아 주세요." forKey:@"0163B"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 오른손을 모두 찾아 주세요." forKey:@"0164B"];
	[_captionMaster setObject:@"아래에 보이는 선들 중 오른손을 모두 찾아 주세요." forKey:@"0165B"];
	[_captionMaster setObject:@"선으로 그려진 그림들이 겹쳐져 있습니다.\n어떤 그림들이 겹쳐져 있는지 아래 그림에서 모두 찾아 보세요." forKey:@"0261"];
	[_captionMaster setObject:@"선으로 그려진 그림들이 겹쳐져 있습니다.\n어떤 그림들이 겹쳐져 있는지 아래 그림에서 모두 찾아 보세요." forKey:@"0262"];
	[_captionMaster setObject:@"선으로 그려진 그림들이 겹쳐져 있습니다.\n어떤 그림들이 겹쳐져 있는지 아래 그림에서 모두 찾아 보세요." forKey:@"0263"];
	[_captionMaster setObject:@"선으로 그려진 그림들이 겹쳐져 있습니다.\n어떤 그림들이 겹쳐져 있는지 아래 그림에서 모두 찾아 보세요." forKey:@"0264"];
	[_captionMaster setObject:@"선으로 그려진 그림들이 겹쳐져 있습니다.\n어떤 그림들이 겹쳐져 있는지 아래 그림에서 모두 찾아 보세요." forKey:@"0265"];
}

- (void)loadNarrationMaster{
	
	_narrationMaster = [[NSMutableDictionary alloc] initWithCapacity:0];
	[_narrationMaster setObject:@"snd_1_6A" forKey:@"0161A"];
	[_narrationMaster setObject:@"snd_1_6A" forKey:@"0162A"];
	[_narrationMaster setObject:@"snd_1_6A" forKey:@"0163A"];
	[_narrationMaster setObject:@"snd_1_6A" forKey:@"0164A"];
	[_narrationMaster setObject:@"snd_1_6A" forKey:@"0165A"];
	[_narrationMaster setObject:@"snd_1_6B" forKey:@"0161B"];
	[_narrationMaster setObject:@"snd_1_6B" forKey:@"0162B"];
	[_narrationMaster setObject:@"snd_1_6B" forKey:@"0163B"];
	[_narrationMaster setObject:@"snd_1_6B" forKey:@"0164B"];
	[_narrationMaster setObject:@"snd_1_6B" forKey:@"0165B"];
	[_narrationMaster setObject:@"snd_2_6" forKey:@"0261"];
	[_narrationMaster setObject:@"snd_2_6" forKey:@"0262"];
	[_narrationMaster setObject:@"snd_2_6" forKey:@"0263"];
	[_narrationMaster setObject:@"snd_2_6" forKey:@"0264"];
	[_narrationMaster setObject:@"snd_2_6" forKey:@"0265"];
}

- (id)init {
	if( ( self = [super init] ) )  {
		
		[self loadContentMaster];
		[self loadSettingValues];
		[self loadCaptionMaster];
		[self loadNarrationMaster];
	}
	
	return self;
}

- (void)dealloc {
	
	[_contentMaster release];
	[_captionMaster release];
	[_narrationMaster release];
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

- (NSString *)diversionWithSeq:(NSString *)contentSeq{
	
	int value = 1;
	
	for (int i=0; i<_contentMaster.count; i++) {
		
		NSDictionary *nDic = [_contentMaster objectAtIndex:i];
		NSString *masterSeq = [nDic objectForKey:@"seq"];
		
		if ([contentSeq isEqualToString:masterSeq]) {
			value = [[nDic objectForKey:@"diversionCnt"] intValue];
			break;
		}
	}
	
	if (value==1) { return nil; }
	
	int result = arc4random() % value;
	NSString *str[10] = {@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"};
	return str[result];
};

- (NSString *)captionWithSeq:(NSString *)contentSeq Diversion:(NSString *)diversion{
	
	NSString *seq = contentSeq;
	
	if (diversion != nil) {
		seq = [NSString stringWithFormat:@"%@%@", contentSeq, diversion];
	}
	
	return [_captionMaster objectForKey:seq];
};

- (NSString *)narrationWithSeq:(NSString *)contentSeq Diversion:(NSString *)diversion{
	
	NSString *seq = contentSeq;
	
	if (diversion != nil) {
		seq = [NSString stringWithFormat:@"%@%@", contentSeq, diversion];
	}
	
	return [_narrationMaster objectForKey:seq];
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

static struct {
	NSString*	seq;
	int			limitTime;
	int			diversionCnt;
    NSString*   subject;
} g_contentInfo[] = {
    @"0161", 25, 2, @"지남력과 주의력(Orientation & Attention)_난이도A1",
	@"0162", 25, 2, @"지남력과 주의력(Orientation & Attention)_난이도A2",
	@"0163", 25, 2, @"지남력과 주의력(Orientation & Attention)_난이도A3",
    @"0164", 25, 2, @"지남력과 주의력(Orientation & Attention)_난이도B",
	@"0165", 25, 2, @"지남력과 주의력(Orientation & Attention)_난이도C",
	@"0261", 60, 1, @"지각력(Perception)_난이도A1",
	@"0262", 60, 1, @"지각력(Perception)_난이도A2",
	@"0263", 60, 1, @"지각력(Perception)_난이도A3",
    @"0264", 60, 1, @"지각력(Perception)_난이도B",
	@"0265", 60, 1, @"지각력(Perception)_난이도C",
};

@end
