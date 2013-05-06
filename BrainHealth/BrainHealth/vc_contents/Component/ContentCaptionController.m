//
//  ContentCaptionController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 22..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentCaptionController.h"

@interface ContentCaptionController ()

@end

@implementation ContentCaptionController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (void)dealloc{
	[super dealloc];
}

- (void)makeContentCaptionWith:(NSString *)contentSeq{
	_captionLabel.text = @"선으로 그려진 그림들이 서로 겹쳐져 있습니다.\n아래 보기에서 겹쳐진 선그림들과 같은 동물들을 찾아 눌러 보세요.";
};

- (IBAction)touchUpInsideWith:(id)sender{
	
	//BaseViewController에 요청.
	if (_delegate && [_delegate respondsToSelector:@selector(didStartContentWithContentCaptionController:)]) {
		[_delegate didStartContentWithContentCaptionController:self];
	}
};

@end
