//
//  Content016ViewController.m
//  BrainHealthTest
//
//  Created by kimwd on 13. 5. 5..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "Content016ViewController.h"
#import "ContentCommon.h"
#import "PairComposition.h"

#define _TAG_VIEW_LEVEL     260000

@interface Content016ViewController ()
    // 레벨별 문제 뷰
    @property (nonatomic, retain) IBOutlet UIView* levelView_1;
    @property (nonatomic, retain) IBOutlet UIView* levelView_2;
    @property (nonatomic, retain) IBOutlet UIView* levelView_3;
    @property (nonatomic, retain) IBOutlet UIView* levelView_4;
    @property (nonatomic, retain) IBOutlet UIView* levelView_5;

    @property (nonatomic, retain) PairComposition* composition; // 같은그림찾기 이미지 구성
@end

@implementation Content016ViewController

#pragma mark - initialize

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Super View Override Method
//생성자(savedDic : 기존에 저장된 문제 설정값들, 공통 화면 생성 후 요청됨)
- (void)makeQuestionWithDic:(NSDictionary *)savedDic{
	/*required overwrite*/
	
	//기존에 저장된 설정값이 있는가?
	if (savedDic) {
		
	}
    [self loadPairComposition];
    [self loadQuestionView];
    [self loadQuestionImage];
    [self rePositioningQuestionImage];
	
};

//실행자('시작' 버튼 누르면 요청됨)
- (void)execute{
	/*required overwrite*/
	
	//타이머 시작요~
	[self startTimer];
};

#pragma mark - Load View
// 레벨에 따른 문제/예제 이미지 로드
- (void)loadPairComposition {
    PairComposition* pairComposition = [[PairComposition alloc] init];
    self.composition = pairComposition;
    [pairComposition release];
}

// 레벨에 따른 화면에 표시될 뷰 로드
- (void)loadQuestionView {
    
    UIView* subView;
    switch ( [self.contentLevel intValue] ) {
        case 1:     subView = self.levelView_1;     break;
        case 2:     subView = self.levelView_2;     break;
        case 3:     subView = self.levelView_3;     break;
        case 4:     subView = self.levelView_4;     break;
        case 5:     subView = self.levelView_5;     break;
        default:    subView = self.levelView_1;     break;
    }
    [subView setTag:_TAG_VIEW_LEVEL];
    [_contentsView addSubview:subView];
}

// 문제/정답에 해당하는 이미지 로드
- (void)loadQuestionImage {
    UIImage* image;
    UIView* levelView = [_contentsView viewWithTag:_TAG_VIEW_LEVEL];
    int total = [[levelView subviews] count];
    
    NSMutableArray* arImage = [self.composition load016QuestionImageWithType:self.contentType level:self.contentLevel WithCount:total];
    
    for (int i = 0; i < total; i++ ) {
        UIButton* button  = [[levelView subviews] objectAtIndex:i];
        [button setTag:i];
        image = [UIImage imageNamed:[arImage objectAtIndex:i]];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateDisabled];
    }
}

// 레벨에 따른 문제 이미지 회전 처리
- (void)rePositioningQuestionImage {
    
    UIView* questionView = [_contentsView viewWithTag:_TAG_VIEW_LEVEL];
    NSArray* arImageView = [questionView subviews];
    int totalCount = [arImageView count];
    UIView* tempView;
    
    switch ( [self.contentLevel intValue] ) {
        case 3: {
            // 전체 이미지에 90 각도 적용
            for ( int i = 0; i < totalCount; i++ ) {
                tempView = [arImageView objectAtIndex:i];
                tempView.transform = CGAffineTransformMakeRotation(degreesToRadians((90*(i+1))));
            }
            break;
        }
        case 4: case 5: {
            // 전체 이미지에 180(랜덤) 각도 적용
            for ( int i = 0; i < totalCount; i++ ) {
                tempView = [arImageView objectAtIndex:i];
                tempView.transform = CGAffineTransformMakeRotation(degreesToRadians((180*(i+1))));
            }
            break;
        }
        default:
            break;
    }
    
}

// 예제이미지 사용자 터치 이벤트 처리 메소드
- (IBAction)exampleImageUserTouchEvent:(id)sender {
    
    UIButton* button;
    BOOL result = [self.composition isCorrectQuestionWithIndex:[sender tag]];
    NSArray* arButtons = [[_contentsView viewWithTag:_TAG_VIEW_LEVEL] subviews];
    
    [sender setEnabled:NO];
    [BHContentUtil answerExampleResult:result WithSuperView:sender];
    
    if ( result ) {
        if ( [self.composition isAllCorrectAnswer] ) {
            
            NSArray* arCorrectAnswer = [self.composition getCorrectAnsewer];
            
            for ( button in arButtons ) {
                if ( [arCorrectAnswer containsObject:[NSNumber numberWithInt:[button tag]]] ) {
                    continue;
                } else {
//                    if ( [button isEnabled] ) {
//                        [button setEnabled:NO];
//                        result = [self.composition isCorrectQuestionWithIndex:[button tag]];
//                        [BHContentUtil answerExampleResult:result WithSuperView:button];
//                    }
                }
            }
            [self resultAnswer:YES];
        }
        
    } else {
        // 1개라도 틀리면 전체 정답 및 오답 표시 및 전체 결과 함수 호출
        for ( button in arButtons ) {
            if ( [button isEnabled] ) {
                [button setEnabled:NO];
//                result = [self.composition isCorrectQuestionWithIndex:[button tag]];
//                [BHContentUtil answerExampleResult:result WithSuperView:button];
            }
        }
        [self resultAnswer:NO];
    }
    
}

@end
