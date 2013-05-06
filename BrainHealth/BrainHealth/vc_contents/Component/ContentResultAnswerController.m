//
//  ContentResultAnswerController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentResultAnswerController.h"

@interface ContentResultAnswerController ()

@end

@implementation ContentResultAnswerController

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
	
	[_resultImageView release];
	
	[super dealloc];
}

- (void)reloadResultAnswer:(BOOL)isRight{
	
	UIImage *resultImage = nil;
	
	if (isRight) {
		resultImage = [UIImage imageNamed:@"tp_b_0_.png"];
	}
	else{
		resultImage = [UIImage imageNamed:@"tp_b_X_.png"];
	}
	
	[_resultImageView setImage:resultImage];
};

- (IBAction)touchUpInsideWith:(id)sender{
	
	if (_delegate && [_delegate respondsToSelector:@selector(didTouchWithResultAnswerController:)]) {
		[_delegate didTouchWithResultAnswerController:self];
	}
}

@end
