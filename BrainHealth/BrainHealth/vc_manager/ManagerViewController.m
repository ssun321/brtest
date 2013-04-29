//
//  ManagerViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 3. 14..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ManagerViewController.h"
#import "ItemManager.h"

#import "ManagerCell.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

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
    
    self.scrollView.contentSize = self.viewIn.frame.size;
    
    [self.scrollView addSubview:self.viewIn];
    
    int x = 32;
    int y = 188;
    int ox = 109;
    int oy = 39;
    
    ItemManager* manager = [ItemManager shared];
    
    for(int i=0;i<8;i++){
        NSString* index = [NSString stringWithFormat:@"%d", i + 1];
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIImage* image = [UIImage imageNamed:@"admin_pres_unit_button_.png"];
        UIImage* imageSelect = [UIImage imageNamed:@"admin_pres_unit_buttonover_.png"];
        UIImage* imageDisable = nil;//[UIImage imageNamed:@"admin_pres_unit_buttonover_.png"];
        
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:imageSelect forState:UIControlStateSelected];
        NSString* title = [NSString stringWithFormat:@"%d. %@", i + 1, [manager nameWithIndex:index]];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(x, y + oy * i, image.size.width, image.size.height);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.selected = YES;
        button.titleLabel.textAlignment = UITextAlignmentLeft;
        
        [self.viewIn addSubview:button];
        button.tag = 100 * (i + 1);
        [button addTarget:self action:@selector(clickMain:) forControlEvents:UIControlEventTouchUpInside];
        
        NSArray* array = [manager arrayWithIndex:index];
        for(NSString* str in array){
            
            int j = [array indexOfObject:str];
            
            image = [UIImage imageNamed:@"admin_pres_unit_button1_.png"];
            imageSelect = [UIImage imageNamed:@"admin_pres_unit_button1over_.png"];
            imageDisable = [UIImage imageNamed:@"admin_pres_unit_button1x_.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button setBackgroundImage:imageSelect forState:UIControlStateSelected];
            [button setBackgroundImage:imageDisable forState:UIControlStateDisabled];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.tag = 100 * (i + 1) + j + 1;
            
            [button setTitle:str forState:UIControlStateNormal];
            button.frame = CGRectMake(200 + j * ox, y + oy * i, image.size.width, image.size.height);
            [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.viewIn addSubview:button];
        }
        
    }
    
    // admin_pres_unit_button_ , (32, 188),
    // admin_pres_unit_button1x_, (200, 188), 309
    
    // 36, 570 -> 605
    
    _arrayData = [[NSMutableArray alloc] initWithCapacity:10];
    
    [self reloadSlideBar];
    
}

- (void)reloadSlideBar{
    
    [_arrayData removeAllObjects];
    
    for(int i = 0; i < 8; i++){
        UIButton* button = (UIButton*)[self.viewIn viewWithTag:100 * (i + 1)];
        if(button.selected){
            [_arrayData addObject:button];
        }
    }
    
    CGRect rect = _tableView.frame;
    rect.size.height = _tableView.rowHeight * _arrayData.count;
    _tableView.frame = rect;
    
    [_tableView reloadData];
    
}

- (void)clickMain:(id)sender{
    UIButton* button = sender;
    button.selected = !button.selected;
    
    NSString* index = [NSString stringWithFormat:@"%d", button.tag / 100];
    NSArray* array = [[ItemManager shared] arrayWithIndex:index];
    for(int j = 0;j < array.count; j++){
        UIButton* btn = (UIButton*)[self.viewIn viewWithTag:button.tag + j + 1];
        btn.enabled = button.selected;
    }
}

- (void)clickItem:(id)sender{
    UIButton* button = sender;
    button.selected = !button.selected;
    
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
    [_scrollView release];
    [_viewIn release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setViewIn:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
- (IBAction)clickBack:(id)sender {
    
    int count = self.navigationController.viewControllers.count;
    
    if(count >= 3){
        UIViewController* toController = [self.navigationController.viewControllers objectAtIndex:count - 3];
        [self.navigationController popToViewController:toController animated:YES];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}


#define _TAG_LABEL_TITLE  1001

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ManagerCell* cell = (ManagerCell*)[tableView dequeueReusableCellWithIdentifier:@"ManagerCell"];
    if(cell == nil){
        NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"ManagerCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
        
        UIImage* image = [UIImage imageNamed:@"admin_pres_focus_button_.png"];
        cell.imageViewSlider.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    }
    
    UIButton* button = [_arrayData objectAtIndex:indexPath.row];
    
    cell.labelName.text = button.titleLabel.text;
    
    return cell;

}

#pragma mark - UITableViewDelegate

@end
