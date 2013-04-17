//
//  UserCenterViewController.m
//  BrainHealth
//
//  Created by Tim on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "UserCenterViewController.h"

#import "UserCell.h"
#import "User.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

@synthesize arrayUser;

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
    
    
    arrayUser = [[NSMutableArray alloc] initWithCapacity:10];
    
    User* user = nil;
    
    user = [[User alloc] init];
    user.name = @"김꽃분이님";
    user.isMan = NO;
    user.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*5];
    user.dateStart = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*240];
    
    [arrayUser addObject:user];
    [user release];
    
    
    user = [[User alloc] init];
    user.name = @"김꽃분이님";
    user.isMan = NO;
    user.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*5];
    user.dateStart = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*240];
    
    [arrayUser addObject:user];
    [user release];
    
    
    user = [[User alloc] init];
    user.name = @"김꽃분이님";
    user.isMan = NO;
    user.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*5];
    user.dateStart = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*240];
    
    [arrayUser addObject:user];
    [user release];
                 
    
}

- (void)dealloc{
    
    [arrayUser release];
    [_tableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayUser.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserCell* cell = nil;
    
    cell = (UserCell*)[tableView dequeueReusableCellWithIdentifier:@"USERCELL"];
    if(cell == nil){
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"USERCELL"];
    }
    
    [cell settingBackgroundWithIndex:indexPath.row last:(indexPath.row == self.arrayUser.count - 1)];
    cell.user = [self.arrayUser objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate



- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
