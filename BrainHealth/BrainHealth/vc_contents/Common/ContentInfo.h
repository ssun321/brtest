//
//  ContentInfo.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 16..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentInfo : NSObject{

	NSMutableArray *_contentMaster;
	
	BOOL _setting_narration;
	BOOL _setting_caption;
	BOOL _setting_sound;
	BOOL _setting_timer;
}

@property(nonatomic, assign)BOOL setting_narration;
@property(nonatomic, assign)BOOL setting_caption;
@property(nonatomic, assign)BOOL setting_sound;
@property(nonatomic, assign)BOOL setting_timer;

+ (ContentInfo*)shared;

- (NSString *)subjectWithSeq:(NSString *)contentSeq;
- (int)limitTimeWithSeq:(NSString *)contentSeq;

- (int)currentIndex;
- (int)currentCount;

@end





static struct {
	NSString*	seq;
	int			limitTime;
    NSString*   subject;
} g_contentInfo[] = {
	@"0111", 60, @"개념형성과 추리력_난이도A1",
	@"0112", 99, @"개념형성과 추리력_난이도A2",
	@"0113", 99, @"개념형성과 추리력_난이도A3",
	@"0114", 99, @"개념형성과 추리력_난이도A4",
	@"0115", 99, @"개념형성과 추리력_난이도A5",
	@"0121", 60, @"개념형성과 추리력_난이도B1",
	@"0121", 60, @"개념형성과 추리력_난이도B2",
	@"1111", 60, @"개념형성과 추리력_난이도B1",
    @"0161", 25, @"지남력과 주의력(Orientation & Attention)_난이도A1",
	@"0162", 25, @"지남력과 주의력(Orientation & Attention)_난이도A2",
	@"0163", 25, @"지남력과 주의력(Orientation & Attention)_난이도A3",
    @"0164", 25, @"지남력과 주의력(Orientation & Attention)_난이도B",
	@"0165", 25, @"지남력과 주의력(Orientation & Attention)_난이도C",
	@"0261", 60, @"지각력(Perception)_난이도A1",
	@"0262", 60, @"지각력(Perception)_난이도A2",
	@"0263", 60, @"지각력(Perception)_난이도A3",
    @"0264", 60, @"지각력(Perception)_난이도B",
	@"0265", 60, @"지각력(Perception)_난이도C",
};


#define USER_KEY_CHECK_INSTALL_APP	@"CONTENT_CHECK_FIRST_INSTALL_APP"
#define USER_KEY_CONTENT_NARRATION	@"CONTENT_SETTING_NARRATION_BOOL"
#define USER_KEY_CONTENT_CAPTION	@"CONTENT_SETTING_CAPTION_BOOL"
#define USER_KEY_CONTENT_SOUND		@"CONTENT_SETTING_SOUND_BOOL"
#define USER_KEY_CONTENT_TIMER		@"CONTENT_SETTING_TIMER_BOOL"


