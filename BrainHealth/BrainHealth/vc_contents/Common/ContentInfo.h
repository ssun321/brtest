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
	NSMutableDictionary *_captionMaster;
	NSMutableDictionary *_narrationMaster;
	
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
- (NSString *)diversionWithSeq:(NSString *)contentSeq;
- (NSString *)captionWithSeq:(NSString *)contentSeq Diversion:(NSString *)diversion;
- (NSString *)narrationWithSeq:(NSString *)contentSeq Diversion:(NSString *)diversion;

- (int)currentIndex;
- (int)currentCount;

@end








#define USER_KEY_CHECK_INSTALL_APP	@"CONTENT_CHECK_FIRST_INSTALL_APP"
#define USER_KEY_CONTENT_NARRATION	@"CONTENT_SETTING_NARRATION_BOOL"
#define USER_KEY_CONTENT_CAPTION	@"CONTENT_SETTING_CAPTION_BOOL"
#define USER_KEY_CONTENT_SOUND		@"CONTENT_SETTING_SOUND_BOOL"
#define USER_KEY_CONTENT_TIMER		@"CONTENT_SETTING_TIMER_BOOL"


