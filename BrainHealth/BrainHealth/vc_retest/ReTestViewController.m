//
//  ReTestViewController.m
//  BrainHealth
//
//  Created by Tim on 13. 5. 1..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ReTestViewController.h"
#import "ReTestCell.h"

@interface ReTestViewController ()

@end

@implementation ReTestViewController

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
    
    UIImage* image = [UIImage imageNamed:@"tp_index_box_.png"];
    self.imageViewBG.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(40, 40, 40, 40)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_imageViewBG release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageViewBG:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReTestCell* cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"ReTestCell"];
    if(cell == nil){
        NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"ReTestCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    
    cell.imageViewBG.image = (indexPath.row % 2 == 0) ? [UIImage imageNamed:@"menu_review_inbox02_.png"] : [UIImage imageNamed:@"menu_review_inbox03_.png"];
    cell.labelNum.text = [NSString stringWithFormat:@"%02d", indexPath.row + 1];
    cell.labelTitle.text = [NSString stringWithFormat:@"처방형 / 난이도 %@ / %d일차(120일)", @"하3", indexPath.row * 5 + 1];
    cell.labelDate.text = @"2013/04/15";
    
    if(indexPath.row < 3){
        [cell.button setImage:[UIImage imageNamed:@"menu_review_button00_.png"] forState:UIControlStateNormal];
        [cell.button setImage:[UIImage imageNamed:@"menu_review_button00over_.png"] forState:UIControlStateHighlighted];
    }else{
        [cell.button setImage:[UIImage imageNamed:@"menu_review_button01_.png"] forState:UIControlStateNormal];
        [cell.button setImage:[UIImage imageNamed:@"menu_review_button01over_.png"] forState:UIControlStateHighlighted];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate






@end
