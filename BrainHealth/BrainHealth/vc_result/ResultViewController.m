//
//  ResultViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ResultViewController.h"
#import "GraphView.h"

#import "result.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

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
    
    UIImage* image = self.imageViewBG.image;
    self.imageViewBG.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    
    GraphView* graphView;
    
    int h = RESULT_TABLE_ROW;
    for(int i = 0; i < 8; i++){
        graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, i * h, self.scrollView.frame.size.width, h)];
        [self.scrollView addSubview:graphView];
        [graphView release];
        graphView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"result_graph_contents_0%d_.png", i + 1]];
        [graphView.button addTarget:self action:@selector(clickToogle:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, h * 8);
    
    self.viewPopup.hidden = YES;
    self.viewPopup.frame = self.view.bounds;
    [self.view addSubview:self.viewPopup];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageViewBG release];
    [_buttonTab0 release];
    [_buttonTab1 release];
    [_scrollView release];
    [_tableViewPopup release];
    [_viewPopup release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageViewBG:nil];
    [self setButtonTab0:nil];
    [self setButtonTab1:nil];
    [self setScrollView:nil];
    [self setTableViewPopup:nil];
    [self setViewPopup:nil];
    [super viewDidUnload];
}
- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickTab0:(id)sender {
    self.buttonTab0.selected = YES;
    self.buttonTab1.selected = NO;
}

- (IBAction)clickTab1:(id)sender {
    self.buttonTab0.selected = NO;
    self.buttonTab1.selected = YES;
}

- (IBAction)clickPopupClose:(id)sender {
    self.viewPopup.hidden = YES;
    self.tableViewPopup.dataSource = nil;
    self.tableViewPopup.delegate = nil;
    
    [self.tableViewPopup reloadData];
}

- (void)clickToogle:(id)sender{
    GraphView* v = (GraphView*)[sender superview];
    
    self.tableViewPopup.dataSource = v;
    self.tableViewPopup.delegate = v;
    
    [self.tableViewPopup reloadData];
    
    self.viewPopup.hidden = NO;

}

@end
