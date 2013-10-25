//
//  RBKDebugLoggerViewController.m
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-25.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import "RBKDebugLoggerViewController.h"
#import "RBKDebugSession.h"
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObject+MagicalFinders.h>

@interface RBKDebugLoggerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *logsTableView, *categoriesTableView, *sessionsTableView, *levelsTableView;

@property (strong, nonatomic) NSSet *categories;
@property (strong, nonatomic) NSArray *logs, *sessions, *levels;
@property (strong, nonatomic) NSSet *selectedSessions, *ignoredCategories, *ignoredLevels;

@end

@implementation RBKDebugLoggerViewController

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
    [self loadSessions];
    [self reloadLogs];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadSessions {
    self.sessions = [RBKDebugSession MR_findAllSortedBy:@"startDate" ascending:YES];
    [self.sessionsTableView reloadData];
}

- (void)reloadLogs {
}

#pragma mark - Events 

- (IBAction)close:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(debugLoggerViewControllerDidTapClose:)]) {
        [self.delegate debugLoggerViewControllerDidTapClose:self];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource implementations

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.sessionsTableView) {
        return self.sessions.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"StandardCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    if(tableView == self.sessionsTableView) {
        RBKDebugSession *session = self.sessions[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", session.startDate, session.endDate ? session.endDate : @"(in progress or crashed)"];
    }

    return cell;
}

@end
