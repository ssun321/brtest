//
//  BaseViewController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 10..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "BaseViewController.h"

#import "ContentCommon.h"
#import "ContentCaptionController.h"
#import "ContentTimerController.h"
#import "ContentResultAnswerController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize contentSeq = _contentSeq;
@synthesize contentType = _contentType;
@synthesize contentLevel = _contentLevel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil level:(NSString *)strLevelOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		// content type, level, seq
		NSString *className = NSStringFromClass([self class]);
		if (className.length == 24) {
			[self setContentType:[className substringWithRange:NSMakeRange(7, 3)]];
			[self setContentLevel:strLevelOrNil];
			
			NSString *seq = self.contentType;
			if (self.contentLevel != nil) {
				seq = [NSString stringWithFormat:@"%@%@", self.contentType, self.contentLevel];
			}
			[self setContentSeq:seq];
		}
    }
    return self;
}

- (void)loadUIFrame{
	
	//self.view
	[self.view setBackgroundColor:[UIColor whiteColor]];
	[self.view setFrame:CGRectMake(0.0f, 0.0f, 1024.0f, 768.0f -20.0f)];
	
	//baseView
	_contentsView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 67.0f, self.view.frame.size.width, self.view.frame.size.height -67.0f -25.0f)]; //h_656
	[self.view addSubview:_contentsView];
	[_contentsView release];
	
	//topViews
	_baseTopView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 87.0f)];
	[self.view addSubview:_baseTopView];
	[_baseTopView release];
	
	//topViews -bg_image
	UIImage *topBackgroundImage = [UIImage imageNamed:@"tp_menu_bg_.png"];
	UIImageView *topBackgroundImageView = [[UIImageView alloc] initWithImage:topBackgroundImage];
	[topBackgroundImageView setFrame:_baseTopView.bounds];
	[_baseTopView addSubview:topBackgroundImageView];
	[topBackgroundImageView release];
	
	//topViews -logo_image
	UIImage *logoImage = [UIImage imageNamed:@"tp_menu_t_.png"];
	UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
	[logoImageView setFrame:CGRectMake(35.0f, 17.0f, logoImage.size.width, logoImage.size.height)];
	[_baseTopView addSubview:logoImageView];
	[logoImageView release];
	
	//topViews -setting_button
	UIImage *settingButtonNormalImage = [UIImage imageNamed:@"tp_menu_button02_.png"];
	UIImage *settingButtonOverImage = [UIImage imageNamed:@"tp_menu_button02_over_.png"];
	_baseSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_baseSettingButton setImage:settingButtonNormalImage forState:UIControlStateNormal];
	[_baseSettingButton setImage:settingButtonOverImage forState:UIControlStateHighlighted];
	[_baseSettingButton setFrame:CGRectMake(_baseTopView.frame.size.width -10.0f -settingButtonNormalImage.size.width, 13.0f, settingButtonNormalImage.size.width, settingButtonNormalImage.size.height)];
	[_baseTopView addSubview:_baseSettingButton];
	
	//topViews -menu_button
	UIImage *menuButtonNormalImage = [UIImage imageNamed:@"tp_menu_button01_.png"];
	UIImage *menuButtonOverImage = [UIImage imageNamed:@"tp_menu_button01_over_.png"];
	_baseMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_baseMenuButton setImage:menuButtonNormalImage forState:UIControlStateNormal];
	[_baseMenuButton setImage:menuButtonOverImage forState:UIControlStateHighlighted];
	[_baseMenuButton setFrame:CGRectMake(_baseSettingButton.frame.origin.x -3.0f -menuButtonNormalImage.size.width, _baseSettingButton.frame.origin.y, menuButtonNormalImage.size.width, menuButtonNormalImage.size.height)];
	[_baseTopView addSubview:_baseMenuButton];
	
	//bottomViews
	_baseBottomView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.view.frame.size.height -25.0f, self.view.frame.size.width, 25.0f)];
	[_baseBottomView setBackgroundColor:[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1.0f]];
	[self.view addSubview:_baseBottomView];
	[_baseBottomView release];
	
	//bottomViews -subject label
	_baseSubjectLabel = [[UILabel alloc] initWithFrame:_baseBottomView.bounds];
	[_baseSubjectLabel setTextColor:[UIColor colorWithRed:73.0f/255.0f green:73.0f/255.0f blue:73.0f/255.0f alpha:1.0f]];
	[_baseSubjectLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
	[_baseSubjectLabel setBackgroundColor:[UIColor clearColor]];
	[_baseSubjectLabel setTextAlignment:NSTextAlignmentCenter];
	[_baseBottomView addSubview:_baseSubjectLabel];
	[_baseSubjectLabel release];
	
	//bottomViews -count label
	_baseCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(_baseBottomView.frame.size.width -50.0f -15.0f, 0.0f, 50.0f, _baseBottomView.frame.size.height)];
	[_baseCountLabel setTextColor:[UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0f]];
	[_baseCountLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
	[_baseCountLabel setBackgroundColor:[UIColor clearColor]];
	[_baseCountLabel setTextAlignment:NSTextAlignmentRight];
	[_baseBottomView addSubview:_baseCountLabel];
	[_baseCountLabel release];
	
}

- (void)loadContentInfo{
	
	//subject
	_baseSubjectLabel.text = [BHContentInfo subjectWithSeq:self.contentSeq];
	
	//index / count
	NSString *newValue = [NSString stringWithFormat:@"%d/%d", BHContentInfo.currentIndex, BHContentInfo.currentCount];
	_baseCountLabel.text = newValue;
}

- (void)loadCaptionController{
	//create
	ContentCaptionController *captionController = [[ContentCaptionController alloc] initWithNibName:@"ContentCaptionController" bundle:nil];
	
	//addsubview
	[self.view addSubview:captionController.view];
	
	//init
	[captionController setDelegate:self];
	[captionController makeContentCaptionWith:self.contentSeq];
}

- (void)loadTimerController{
	//create
	_timerController = [[ContentTimerController alloc] initWithNibName:@"ContentTimerController" bundle:nil];
	
	//addsubview
	[_baseTopView addSubview:_timerController.view];
	[_timerController.view setFrame:CGRectMake(290.0f, 8.0f, 418.0f, 50.0f)];
	
	//init
	[_timerController setDelegate:self];
	[_timerController setLimitTime:[BHContentInfo limitTimeWithSeq:self.contentSeq]];
	[_timerController reloadTimerViewType:TimerViewTypeDefault]; //설정에서 얻어야함
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self loadUIFrame];
	[self loadContentInfo];			//상단 하단 컨텐츠 정보 얻기
	[self loadCaptionController];	//지문팝업 요청
	[self loadTimerController];		//타이머 로드
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
	
	[_contentsView release];
	[_baseTopView release];
	[_baseBottomView release];
	[_baseSubjectLabel release];
	[_baseCountLabel release];
	[_baseMenuButton release];
	[_baseSettingButton release];
	
	[_contentSeq release];
	[_contentType release];
	[_contentLevel release];
	
	[_timerController.view removeFromSuperview];
	[_timerController setDelegate:nil];
	[_timerController release];
	
	[super dealloc];
}


//생성자(savedDic : 기존에 저장된 문제 설정값들, 공통 화면 생성 후 요청됨)
- (void)makeQuestionWithDic:(NSDictionary *)savedDic{/*required overwrite*/};

//실행자('시작' 버튼 누르면 요청됨)
- (void)execute{/*required overwrite*/};




- (void)startTimer{
	[_timerController startTimerController];
};

- (void)stopTimer{
	[_timerController stopTimerController];
};

- (void)resultAnswer:(BOOL)isRight{
	
	//stop timer
	[_timerController stopTimerController];
	
	
	//결과값 저장해야함...
	
	
	//create
	ContentResultAnswerController *resultController = [[ContentResultAnswerController alloc] initWithNibName:@"ContentResultAnswerController" bundle:nil];
	//addsubview
	[self.view addSubview:resultController.view];
	//init
	[resultController setDelegate:self];
	[resultController reloadResultAnswer:isRight];
};


#pragma mark - ContentCaptionControllerDelegate
- (void)didStartContentWithContentCaptionController:(ContentCaptionController *)captionController{
	
	//제거
	[captionController.view removeFromSuperview];
	[captionController setDelegate:nil];
	[captionController release];
	
	//실행자 요청
	[self execute];
};

#pragma mark - ContentTimerControllerDelegate
- (void)didEndTimerWithContentTimerController{
	[self resultAnswer:FALSE];
}

#pragma mark - ContentResultAnswerControllerDelegate
- (void)didTouchWithResultAnswerController:(ContentResultAnswerController *)resultAnswerController{
	//제거
	[resultAnswerController.view removeFromSuperview];
	[resultAnswerController setDelegate:nil];
	[resultAnswerController release];
	
	NSLog(@"완전 종료!!! 다음문제 요청 들어가야함...");
    
    [self.delegate next];
    
};

@end
