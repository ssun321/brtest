//
//  MenuViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 2. 27..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "MenuViewController.h"
#import "BaseViewController.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)test:(id)sender{
#warning 컨텐츠 로드 샘플
    NSString* clsName = @"Content016ViewController";
    Class cls = NSClassFromString(clsName);
    BaseViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil level:@"4"];
    [self.navigationController pushViewController:vc animated:YES];
    [vc makeQuestionWithDic:nil];
    [vc release];
    
    UIButton* button = sender;
    
    NSString* msg = [NSString stringWithFormat:@"버튼 눌림 : %@", [button titleForState:UIControlStateNormal]];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)dealloc {
    [_viewMenu0 release];
    [_buttonMenu0 release];
    [_buttonMenu1 release];
    [_buttonMenu2 release];
    [_buttonMenu3 release];
    [_viewMenu1 release];
    [_viewMenu2 release];
    [_viewMenu3 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setViewMenu0:nil];
    [self setButtonMenu0:nil];
    [self setButtonMenu1:nil];
    [self setButtonMenu2:nil];
    [self setButtonMenu3:nil];
    [self setViewMenu1:nil];
    [self setViewMenu2:nil];
    [self setViewMenu3:nil];
    [super viewDidUnload];
}

// 인지치료
- (IBAction)clickMenu0:(id)sender {
    
    [_viewMenu0 removeFromSuperview];
    [_viewMenu1 removeFromSuperview];
    [_viewMenu2 removeFromSuperview];
    [_viewMenu3 removeFromSuperview];
    
    _viewMenu0.center = [sender center];
    [self.view addSubview:_viewMenu0];
    
}

// 일기
- (IBAction)clickMenu1:(id)sender {
    
    [_viewMenu0 removeFromSuperview];
    [_viewMenu1 removeFromSuperview];
    [_viewMenu2 removeFromSuperview];
    [_viewMenu3 removeFromSuperview];
    
    _viewMenu1.center = [sender center];
    
    [self.view addSubview:_viewMenu1];
}

// 인지훈련
- (IBAction)clickMenu2:(id)sender {
    
    [_viewMenu0 removeFromSuperview];
    [_viewMenu1 removeFromSuperview];
    [_viewMenu2 removeFromSuperview];
    [_viewMenu3 removeFromSuperview];
    
    _viewMenu2.center = [sender center];
    
    [self.view addSubview:_viewMenu2];
}

// 설문/결과
- (IBAction)clickMenu3:(id)sender {
    
    [_viewMenu0 removeFromSuperview];
    [_viewMenu1 removeFromSuperview];
    [_viewMenu2 removeFromSuperview];
    [_viewMenu3 removeFromSuperview];
    
    _viewMenu3.center = [sender center];
    
    [self.view addSubview:_viewMenu3];
}

#pragma mark - move page

- (void)move:(NSString*)clsName{
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

#pragma mark - 인지치료 서브메뉴

- (IBAction)clickMenu00:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu01:(id)sender {
    // 훈련형 인지치료
    [self move:@"TrainingViewController"];
}

- (IBAction)clickMenu02:(id)sender {
    // 복습하기
    [self move:@"ReTestViewController"];
}

- (IBAction)clickMenu0_close:(id)sender {
    [[sender superview] removeFromSuperview];
}

#pragma mark - 일기 서브메뉴

- (IBAction)clickMenu10:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu11:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu12:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu1_close:(id)sender {
    [[sender superview] removeFromSuperview];
}

#pragma mark - 인지훈련 서브메뉴

- (IBAction)clickMenu20:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu21:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu22:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu23:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu2_close:(id)sender {
    [[sender superview] removeFromSuperview];
}

#pragma mark - 설문/결과 서브메뉴

- (IBAction)clickMenu30:(id)sender {
    [self move:@"ResultViewController"];
}

- (IBAction)clickMenu31:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu32:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu33:(id)sender {
    [self test:sender];
}

- (IBAction)clickMenu3_close:(id)sender {
    [[sender superview] removeFromSuperview];
}

@end
